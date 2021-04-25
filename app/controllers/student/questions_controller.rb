class Student::QuestionsController < Student::Base
  def new
    @question = Question.new
  end
end
