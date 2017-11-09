module QuestionsHelper
  def form_title
    @question.new_record? ? "Nueva Pregunta" : "Editar Pregunta"
  end
  def show_search_question
    controller.action_name == "index" || controller.action_name == "show"
  end
  def votes_prom(upvotes, downvotes)
    upvotes - downvotes
  end
  def last_qc(qc, question_comments)
    unless question_comments.last == qc
      '<hr>'.html_safe
    else
      ''
    end
  end

end
