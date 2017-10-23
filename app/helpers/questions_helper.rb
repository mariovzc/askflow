module QuestionsHelper
  def form_title
    @question.new_record? ? "Nueva Pregunta" : "Editar Pregunta"
  end
end
