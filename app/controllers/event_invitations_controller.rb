class EventInvitationsController < ApplicationController
  def create
    invitation = EventInvitation.new(ei_params)
    invited = invitation.attendee
    event = invitation.attended_event
    if invitation.save
      flash[:notice] = "User: #{invited.name} Invited successfully"
    else
      flash[:warning] = "Invitation for user: #{invited.name} failed"
    end
    redirect_to event_path(event)
  end

  private

  def ei_params
    params.require(:invitation).permit(:attendee_id, :attended_event_id)
  end
end
