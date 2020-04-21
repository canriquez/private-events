class EventsController < ApplicationController
  def create
    @event = Event.new(event_params)
    @current_user = User.find_by(remember_me: cookies[:remember_me]);
    @event.creator_id = @current_user.id if @current_user
    if @current_user && @event.save
      flash[:notice] = "Event: #{@event.name} saved successfully"
      redirect_to root_path
    else

      
      render :new
    end
  end

  def new
    @event = Event.new
  end

  def show
  end

  def index
  end


  private

  def event_params
    params.require(:event).permit(:name,:description, :place, :date)
  end
end
