class Teacher::QuestionsController < Teacher::Base
  def index
    @questions = Question.where(subject: current_teacher_member.subject).order(created_at: :desc)
    @questions = @questions.page(params[:page])
  end

  def show
    @question = Question.find(params[:id])
  end
end