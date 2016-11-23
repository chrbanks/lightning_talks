class UsersController < ApplicationController
  before_action :set_user, only: [:show, :followers, :following]

  def index
    @users = User.all.order(:email)
  end

  def show
    @talks = @user.talks
  end

  def followers
    @users = @user.followers
  end

  def following
    @users = @user.followed_users    
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
