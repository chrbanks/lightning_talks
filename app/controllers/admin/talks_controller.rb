class Admin::TalksController < Admin::ApplicationController
  before_action :set_talk, only: [:edit, :update, :destroy]
  before_action :set_meeting, only: [:new, :edit]

  def new
    @talk = Talk.new
  end

  def create
    @talk = Talk.new(talk_params.merge!({ meeting_id: talk_params[:meeting_id],
                                          user_id: talk_params[:user_id] }))
    if @talk.save
      redirect_to meeting_talk_path(params[:meeting_id], @talk),
        notice: 'Talk was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @talk.update(talk_params)
      redirect_to meeting_talk_path(@talk.meeting_id, @talk),
        notice: 'Talk was successfully updated'
    else
      render :edit
    end
  end

  private

  def set_talk
    @talk = Talk.find(params[:id])
  end

  def set_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end

  def talk_params
    params.require(:talk).permit(:meeting_id, :title, :user_id, :description)
  end
end
