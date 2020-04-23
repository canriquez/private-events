class ApplicationController < ActionController::Base
  def sign_in(user)
    cookies.permanent[:remember_me] = user.create_token
  end

  def current_user
    @current_user = User.find_by(remember_me: cookies[:remember_me])
  end

  def user_signedin?
    if !@current_user
      flash[:alert] = 'You are not allowed to visint this route. Sign In!'
      redirect_to root_path
    end
  end

  def same_user?
    if @current_user.id != params[:id]
      flash[:alert] = "You are not allowed to visit other users's profile!"
      redirect_to root_path
    end 
  end

end
