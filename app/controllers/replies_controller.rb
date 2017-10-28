class RepliesController < ApplicationController
  before_action do
    @comment = Comment.find(params[:comment_id])    
  end

  def new
    @reply = @comment.replies.new()
  end
  def create
    @reply = @comment.replies.new(reply_params)
    asd
  end

  private
  def reply_params
    params.require(:comment).permit(:body).merge(user: current_user)    
  end
end
