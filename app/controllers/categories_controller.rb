class CategoriesController < ApplicationController
  def show
    @category = params[:id]
    @talks = Talk.where(category: params[:id])
  end
end
