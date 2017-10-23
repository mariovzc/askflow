module SessionsHelper
  def question_owner
    current_user == @question.user
  end
end
