class QuestionsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  private

  def set_question
  end

  def question_params
  end
end
