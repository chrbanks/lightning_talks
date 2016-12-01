class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.order(date: :desc).page(params[:page])
  end

  def show
    @talks = @meeting.talks.includes(:user)
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params.merge!(user_id: current_user.id))

    if @meeting.save
      redirect_to @meeting, notice: 'Lightning talk session was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @meeting.update(meeting_params)
      redirect_to @meeting, notice: 'Lightning talk session was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @meeting.destroy
    redirect_to root_path, notice: 'Lightning talk session was successfully deleted'
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:date, :title, :user_id, :location)
  end
end
