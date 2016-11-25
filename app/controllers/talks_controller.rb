class TalksController < ApplicationController
  before_action :set_user, only: [:index]
  before_action :set_meeting, only: [:new, :create]
  before_action :set_talk, only: [:show, :edit, :update, :destroy]

  def index
    @talks = @user.talks.page(params[:page])
  end

  def show
    @comments = @talk.comments.includes(:user).to_a
    @comment = @talk.comments.new
  end

  def new
    @talk = @meeting.talks.new
  end

  def create
    @talk = @meeting.talks.new(talk_params)
    if @talk.save
      redirect_to @talk, notice: 'Talk was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @talk.update(talk_params)
      redirect_to @talk
    else
      render :edit
    end
  end

  def destroy
    @talk.destroy
    redirect_to @talk.meeting, notice: 'Talk was successfully deleted.'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def set_talk
    @talk = Talk.find(params[:id])
  end

  def talk_params
    params.require(:talk)
          .permit(:meeting_id, :title, :user_id, :description, :category)
          .merge(user_id: current_user.id)
  end
end
