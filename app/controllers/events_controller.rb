class EventsController < ApplicationController
  before_action :allowed?, only: %i[show index new create]

  def create
   # @current_user = User.find_by(remember_me: cookies[:remember_me])
    @event = @current_user.events.build(event_params)
    if @current_user && @event.save
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
    @event = Event.find(params[:id])
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
