class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all.order(:email)
  end

  def show
    @talks = @user.talks
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
