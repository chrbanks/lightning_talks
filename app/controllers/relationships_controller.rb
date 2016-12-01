class RelationshipsController < ApplicationController
  before_action :signed_in_user

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js { render content_type: 'text/plain' }
    end
  end

  def destroy
    @user = Relationship.includes(:followed).find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js { render content_type: 'text/plain' }
    end
  end
end
