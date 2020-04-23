class EventInvitationsController < ApplicationController

    def create
        invitation = EventInvitation.new(ei_params)
        invited = invitation.attendee
        event = invitation.attended_event
        if invitation.save
          flash[:notice] = "User: #{invited} Invited successfully"
          redirect_to event_path(event)
        else
          flash[:warning] = "Invitation for user: #{invited} failed"
          redirect_to event_path(event)
        end
    end

    private
    def ei_params
        params.require(:invitation).permit(:attendee_id, :attended_event_id)
    end

end
