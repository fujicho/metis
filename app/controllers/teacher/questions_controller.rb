class Teacher::QuestionsController < Teacher::Base
  def index
    @questions = Question.where(subject: current_teacher_member.subject).order(created_at: :desc)
    @open_questions = @questions.where(closed: false).page(params[:page])
    @closed_questions = @questions.where(closed: true).page(params[:closed_page]) 
  end

  def show
    @question = Question.find(params[:id])
  end
end