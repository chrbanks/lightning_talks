class FollowersController < ApplicationController  
  
  def index
    @user = User.find(params[:user_id])
    @users = @user.followers
    respond_to :js
  end
end
