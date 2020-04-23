class UsersController < ApplicationController
  before_action :current_user, only: %i[show index new create]
  before_action :user_signedin?, only: %i[show new create]
  before_action :same_user?, only: %i[show]

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
    @user = User.find(params[:id])
    puts "from mbrowser, User is #{params[:id]}"
    p @user

    @upcoming_events = @user.upcoming_events
    @prev_events = @user.previous_events
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
