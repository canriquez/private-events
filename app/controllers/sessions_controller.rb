class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user
      flash[:notice] = "Welcome #{user.name} back, enjoy your time."
      sign_in(user)
      redirect_to root_path
    else
      flash.now[:alert] = 'The provided credentials are not correct'
      render 'new'
    end
    
  end

  def destroy
  end

end
