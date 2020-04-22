class ApplicationController < ActionController::Base
  def sign_in(user)
    cookies.permanent[:remember_me] = user.create_token
  end

  def allowed?
    @current_user = User.find_by(remember_me: cookies[:remember_me])
  end
end
