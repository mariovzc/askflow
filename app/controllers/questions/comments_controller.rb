class Questions::CommentsController < CommentsController
  before_action :set_commentable

  private

    def set_commentable
      @commentable = Question.friendly.find(params[:question_id])
    end
end