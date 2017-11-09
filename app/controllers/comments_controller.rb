class CommentsController < ApplicationController
  before_action :set_comment, only: [:reply]
  before_action :set_comment_for_votes, only: [:upvote, :downvote, :unvote]
  
  def create
    @comment = @commentable.comments.new(comment_params)
    unless @comment.save
      flash[:danger] = "La respuesta  no puede estar vacio"
    end
    redirect_to @commentable
  end

  def reply
    reply = @comment.replies.new(reply_params)
    unless reply.save
      flash[:danger] = "El comentario no puede estar vacio"
    end
    redirect_to question_path(@comment.commentable_id) 
  end
  
  def question_comments
    comment = Comment.new(question_comments_params)
    comment.commentable_id = params[:question_id]
    unless comment.save
      flash[:danger] = "La respuesta  no puede estar vacio"
    end
    redirect_to question_path(comment.commentable_id) 
  end

  def upvote
    @comment.upvote_by current_user
    redirect_to question_path(@comment.commentable_id)
  end
  def unvote
    @comment.unvote_by current_user
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
  def question_comments_params
    params.require(:qp).permit(:body, :commentable_type).merge(user: current_user)
  end

end
