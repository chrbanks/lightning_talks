class CommentsController < ApplicationController  
  before_action :set_talk

  def create
    @comment = @talk.comments.new(comment_params)
    if @comment.save
      redirect_to @talk
    else
      render 'talks/show'
    end
  end

  private

  def set_talk
    @talk = Talk.find(params[:talk_id])
  end

  def comment_params
    params.require(:comment).permit(:comment).merge(user: current_user)
  end
end
