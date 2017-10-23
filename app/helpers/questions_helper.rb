module QuestionsHelper
  def form_title
    @question.new_record? ? "Nueva Pregunta" : "Editar Pregunta"
  end
  def show_search_question
    controller.action_name == "index" || controller.action_name == "show"
  end
end
