class FavoritesController < ApplicationController  
  
  def index
    @user = User.find(params[:user_id])
    @talks = @user.favorite_talks.page(params[:page])
  end

  def create
    @talk = Talk.find(favorite_params[:talk_id])
    current_user.favorite!(@talk)
    respond_to do |format|
      format.js
      format.html { redirect_to @talk }
    end
  end

  def destroy
    @talk = Favorite.includes(:talk).find(params[:id]).talk
    current_user.unfavorite!(@talk)
    respond_to do |format|
      format.js
      format.html { redirect_to @talk }
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:talk_id)
  end
end
