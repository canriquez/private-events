class ApplicationController < ActionController::Base
  def sign_in(user)
    cookies.permanent[:remember_me] = user.create_token
  end

  def current_user
    @current_user = User.find_by(remember_me: cookies[:remember_me])
  end

  def user_signedin?
    redirect_to root_path, alert: 'You are not allowed to visint this route. Sign In!' unless @current_user
  end

  def same_user?
    return if current_user.id.to_s == params[:id]

    redirect_to root_path, alert: "You are not allowed to visit other users's profile!"
  end
end
