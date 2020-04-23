class EventInvitationsController < ApplicationController

    def create
        puts "EI params is here"
        p ei_params
        invitation = EventInvitation.new(ei_params)
        invited = invitation.attendee
        event = invitation.attended_event

        puts "this is the invitation"
        p invitation

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
