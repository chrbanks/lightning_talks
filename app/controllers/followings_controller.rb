class FollowingsController < ApplicationController  
  
  def index
    @user = User.find(params[:user_id])
    @users = @user.followed_users
    respond_to :js
  end
end
