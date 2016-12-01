class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :followers, :following]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.order(:email).page(params[:page])
  end

  def show
    @talks = @user.talks.latest.page(1)
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      sign_in @user
      redirect_to @user, notice: 'Profile updated'
    else
      render 'edit'
    end    
  end

  def followers
    @users ||= @user.followers.page(params[:page])
  end

  def following
    @users ||= @user.followed_users.page(params[:page])
  end

  def speakers
    @users ||= User.speaker.order(:email).page(params[:page])
  end

  private

  def set_user
    @user ||= User.find(params[:id])
  end

  def correct_user
    redirect_to(root_path) unless current_user?(@user) 
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :bio)
  end
end
