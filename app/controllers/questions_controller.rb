class QuestionsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_question_for_votes, only: [:upvote, :downvote]
  impressionist actions: [:show]
  
  def index
    @questions = Question.with_word(params[:question]).with_order
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to questions_path, notice: 'La pregunta fue creada exitosamente!!!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path, notice: 'La pregunta ha sido Modificada con éxito'
    else
      render :edit
    end
  end

  def upvote
    @question.upvote_by current_user
    redirect_to question_path(@question)
  end
  def downvote
    @question.downvote_by current_user
    redirect_to question_path(@question)
  end
  def destroy
    if @question.destroy
      redirect_to questions_path, notice: "la pregunta fue eliminada con éxito"
    else
      redirect_to questions_path, notice: "la pregunta no fue eliminada"
    end
  end

  private
  def set_question_for_votes
    @question = Question.find(params[:question_id])
  end
  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
