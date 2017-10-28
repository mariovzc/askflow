class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.save
    redirect_to @commentable
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
