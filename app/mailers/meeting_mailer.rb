# frozen_string_literal: true

class MeetingMailer < ApplicationMailer
  def invitation_email(invitee_email, meeting)
    @invitee_email = invitee_email
    @meeting = meeting
    mail(to: @invitee_email, subject: "Invitation to Meeting: #{meeting.name}")
  end

  def acceptance_email(invitee_email, meeting)
    @invitee_email = invitee_email
    @meeting = meeting
    mail(to: @invitee_email, subject: "Acceptance of Meeting Invitation: #{meeting.name}")
  end

  def rejection_email(invitee_email, meeting)
    @invitee_email = invitee_email
    @meeting = meeting
    mail(to: @invitee_email, subject: "Rejection of Meeting Invitation: #{meeting.name}")
  end
end
