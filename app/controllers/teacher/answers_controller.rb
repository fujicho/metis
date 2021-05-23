class Teacher::AnswersController < Teacher::Base
  before_action :prepare_question

  def new
    @answer = Answer.new
  end

  def confirm
    @answer = Answer.new(answer_params)
    @answer.teacher_member = current_teacher_member
    @answer.question = @question
    if @answer.valid?
      render action: "confirm"
    else
      binding.pry
      render action: "new"
    end
  end

  def create
    @answer = Answer.new(answer_params)
    if params[:commit]
      @answer.teacher_member = current_teacher_member
      @answer.question = @question
      if @answer.save
        redirect_to :teacher_root
      else
        render action: "new"
      end
    else
      render action: "new"
    end
  end

  private def prepare_question
    @question = Question.find(params[:question_id])
  end

  private def answer_params
    params.require(:answer).permit(:body)
  end
end