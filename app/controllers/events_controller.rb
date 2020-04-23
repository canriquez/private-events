class EventsController < ApplicationController
  before_action :current_user, only: %i[show index new create]
  before_action :user_signedin?, only: %i[new create]

  def create
    @event = @current_user.events.build(event_params)
    if @current_user && @event.save
      invitation = EventInvitation.new(attended_event: @event, attendee: @current_user)
      invitation.save
      flash[:notice] = "Event: #{@event.name} saved successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @event = Event.new
  end

  def show
    
    @invitation = EventInvitation.new
    @event = Event.find(params[:id])

    puts " Here is the event info we pass to the view"
    p @event
    p @invitation

    @uninvited =  User.where.not(:id => @event.guests)
  end

  def index
    @past = Event.past
    @future = Event.future
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :place, :date)
  end
end
