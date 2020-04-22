class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome #{@user.email}, enjoy your time."
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @current_user = User.find_by(remember_me: cookies[:remember_me])

    @upcoming_events = @current_user.upcoming_events 
    @prev_events = @current_user.previous_events
  end

  private

  def user_params
    params.require(:user).permit(:name,:email)
  end

end
