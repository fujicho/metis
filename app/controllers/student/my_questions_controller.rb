class Student::MyQuestionsController < Student::Base
  def index
    @my_questions = Question.where(student_member_id: current_student_member).order(created_at: :desc)
    @my_questions = @my_questions.page(params[:page])
  end
end