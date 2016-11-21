class FavoritesController < ApplicationController  
  
  def create
    @talk = Talk.find(favorite_params[:talk_id])
    current_user.favorite!(@talk)
    redirect_to @talk
  end

  def destroy
    @talk = Favorite.find(params[:id]).talk
    current_user.unfavorite!(@talk)
    redirect_to @talk
  end

  private

  def favorite_params
    params.require(:favorite).permit(:talk_id)
  end
end
