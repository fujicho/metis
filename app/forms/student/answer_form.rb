class Student::AnswerForm
  include ActiveModel::Model

  delegate :persisted?, to: :question

  attr_accessor :body, :closed


  def initialize(answer = nil)
    @answer = answer
    @answer ||= Answer.new
  end

  def answer_params
    @params.require(:answer).permit(:body)
  end

  def question_params
    @params.require(:question).permit(:closed)
  end
end