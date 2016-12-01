class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.order(:name)
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @talks = Talk.tagged_with(@tag)
  end
end
