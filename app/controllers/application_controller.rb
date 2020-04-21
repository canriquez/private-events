class ApplicationController < ActionController::Base


    def sign_in(user)
        cookies.permanent[:remember_me] = user.create_token
    end

end
