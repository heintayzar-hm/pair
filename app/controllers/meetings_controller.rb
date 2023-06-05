# frozen_string_literal: true

class MeetingsController < ApplicationController
  before_action :meeting_params, only: [:create]
  def index
    @meetings = Meeting.where(user: current_user)
  end

  def show
    @meeting = Meeting.find_by(id: params[:id])
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    # for this version of the app, we will assume that each meeting is 45 mins long
    @meeting.end_time = @meeting.start_time + 45.minutes
    @meeting.user = current_user
    zoom_meeting = create_zoom_meeting(@meeting.start_time, @meeting.name)
    @meeting.zoom_link = zoom_meeting['start_url']

    if @meeting.save
      redirect_to meeting_path(@meeting)
    else
      render :new
    end
  end

  def invite
    @meeting = Meeting.find(params[:id])
    email = invite_params[:invitee_email] # just for easier naming

    # save the email in the meeting
    if @meeting.invitee_emails_array.exclude?(email) && email.present? && current_user.email != email
      @meeting.invitee_emails_array << email
    end
    @meeting.save
    # Check if user with the email exists
    invitee = User.find_by(email:)

    if invitee.nil?
      # User with the email does not exist, send email to unregistered user
    else
      # User with the email exists, associate them with the meeting
      @meeting.invitees << invitee
    end
    MeetingMailer.with(meeting: @meeting).invitation_email(email, @meeting).deliver_now

    redirect_to @meeting, notice: 'Invitations sent successfully.'
  end

  def random_invite
    @meeting = Meeting.find(params[:id])
    # after we implements the avaliablites
  end

  def random_meeting
    # view page for random meeting
    @available_meetings = Meeting.where(is_public: true)
                                 .where.not(user: current_user)
                                 .where('start_time > ?', 1.hour.from_now)
  end

  def join_random_meeting
    # join random meeting
    @meeting = Meeting.find(params[:id])

    unless @meeting.nil?
      # add current user to the meeting
      @meeting.invitees << current_user if @meeting.invitees.exclude?(current_user)

      # add current user to the invitee_emails_array
      @meeting.invitee_emails_array << current_user.email if @meeting.invitee_emails_array.exclude?(current_user.email)

      # save the meeting
      @meeting.invitations.find_by(user: current_user).accept
      @meeting.save
    end

    redirect_to meeting_path(@meeting)
  end

  private

  def meeting_params
    params.require(:meeting).permit(:start_time, :end_time, :description, :name, :is_public)
  end

  def invite_params
    params.require(:meeting).permit(:invitee_email)
  end

  def create_zoom_meeting(start_time, topic)
    access_token = 'eyJzdiI6IjAwMDAwMSIsImFsZyI6IkhTNTEyIiwidiI6IjIuMCIsImtpZCI6ImFiNjY5Njc2LThhOTUtNDhhMi1hNTE3LTY5NDFmODQ3OTg2YiJ9.eyJ2ZXIiOjksImF1aWQiOiI5MzcyYmIxOWEzYTZlZDM4MmNjNTVhNGQ1YmE1YzQ0YSIsImNvZGUiOiJiWUpQRnlVOWhSVkhsaEk1TW1QUjNxcmdVTXgzN1E1eFEiLCJpc3MiOiJ6bTpjaWQ6YlViMTZ3VmRTdWViWE9sTVBXT3FGZyIsImdubyI6MCwidHlwZSI6MCwidGlkIjowLCJhdWQiOiJodHRwczovL29hdXRoLnpvb20udXMiLCJ1aWQiOiJrQndhUzc2MFRxU2szbjMzT1pWeWRBIiwibmJmIjoxNjg1OTI2NjE3LCJleHAiOjE2ODU5MzAyMTcsImlhdCI6MTY4NTkyNjYxNywiYWlkIjoicXRwY210ZTlRZUtUWlhRd29xRXJpQSJ9.WfXQT8qQRYjaDNpp3d21JTu-qjE7WJrGTEp-N2wKoWypt4m4ZJ2HzYXkNDEu7fz-nKDAbXe3IdA_DrrmWK-r-A'
    refresh_token = 'eyJzdiI6IjAwMDAwMSIsImFsZyI6IkhTNTEyIiwidiI6IjIuMCIsImtpZCI6ImU3MTYxMWM0LTk2NzMtNDkxOS1iZThhLTU3ZTc2NDIyZGQyMCJ9.eyJ2ZXIiOjksImF1aWQiOiI5MzcyYmIxOWEzYTZlZDM4MmNjNTVhNGQ1YmE1YzQ0YSIsImNvZGUiOiJiWUpQRnlVOWhSVkhsaEk1TW1QUjNxcmdVTXgzN1E1eFEiLCJpc3MiOiJ6bTpjaWQ6YlViMTZ3VmRTdWViWE9sTVBXT3FGZyIsImdubyI6MCwidHlwZSI6MSwidGlkIjowLCJhdWQiOiJodHRwczovL29hdXRoLnpvb20udXMiLCJ1aWQiOiJrQndhUzc2MFRxU2szbjMzT1pWeWRBIiwibmJmIjoxNjg1OTI2NjE3LCJleHAiOjE2OTM3MDI2MTcsImlhdCI6MTY4NTkyNjYxNywiYWlkIjoicXRwY210ZTlRZUtUWlhRd29xRXJpQSJ9.fTOIm0uZ7buiPd6J2BFwszpyyKhaY1g7Ni5CD_kNVnKUNXCZl-jozq1s1M_HT7idXPVngI21QPrHAvZP7fL73A'
    zoom_service = ZoomService.new(access_token, refresh_token)

    duration = 60
    timezone = 'America/New_York'
    agenda = 'Pair-Programing'

    zoom_service.create_meeting(topic, start_time, duration, timezone, agenda)
  end
end
