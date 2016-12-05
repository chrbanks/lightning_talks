class CategoriesController < ApplicationController
  
  def index
    @categories = Talk::CATEGORIES
  end

  def show
    @talks = Talk.where(category: params[:id]).page(params[:page])
  end
end
