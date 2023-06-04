class InvitationsController < ApplicationController
  def accept
    @meeting = Meeting.find(params[:id])
    @invitation = @meeting.invitations.find_by(user_id: current_user.id)
    @invitation.accept unless @invitation.nil?
    redirect_to home_index_path
  end

  def reject
    @meeting = Meeting.find(params[:id])
    @invitation = @meeting.invitations.find_by(user_id: current_user.id)
    @invitation.reject unless @invitation.nil?
    redirect_to home_index_path
  end

  def invitations
    @invitations = current_user.invitations
  end
end
