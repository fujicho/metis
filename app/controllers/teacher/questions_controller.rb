class Teacher::QuestionsController < Teacher::Base
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end
end