class CommentsController < ApplicationController
  before_action :set_comment, only: [:reply]
  before_action :set_comment_for_votes, only: [:upvote, :downvote]
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.save
    redirect_to @commentable
  end

  def reply
    reply = @comment.replies.new(reply_params)
    reply.save
    redirect_to question_path(@comment.commentable_id) 
  end
  
  def upvote
    @comment.upvote_by current_user
    redirect_to question_path(@comment.commentable_id)
  end
  def downvote
    @comment.downvote_by current_user
    redirect_to question_path(@comment.commentable_id)
  end


  private

  def set_comment
    @comment = Comment.find(params[:id])    
  end

  def set_comment_for_votes
    @comment = Comment.find(params[:comment_id])
  end


  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end

  def reply_params
    params.require(:Reply).permit(:body, :commentable_type).merge(user: current_user)
  end
end
