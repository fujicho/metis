class Student::AnswersController < Student::Base
  before_action :prepare_question

  def new
    @answer = Answer.new
  end

  def confirm
    @answer = Answer.new(answer_params)
    @answer.student_member = current_student_member
    @answer.question = @question
    if @answer.valid?
      render action: "confirm"
      binding.pry
    else
      render action: "new"
    end
  end

  def create
    @answer = Answer.new(answer_params)
    if params[:commit]
      @answer.student_member = current_student_member
      @answer.question = @question
      if @answer.save
        if params[:answer][:question][:closed]
          binding.pry
          @question.update_attributes(closed: "true")
          binding.pry
        end
        redirect_to student_question_path(@question)
        binding.pry
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
    params.require(:answer).permit(:body, :closed)
  end
end
