class Student::QuestionsController < Student::Base

  def index
    @book_search_form = Student::BookSearchForm.new(search_params)
    @books = @book_search_form.search.page(params[:page])
  end

  def new
    @book = Book.find(params[:format])
    @question = Question.new
    @question.book = @book
  end

  #POST
  def confirm
    @question = Question.new(question_params)
    @question.student_member = current_student_member
    @question.book = Book.find(params[:book_id])
    if @question.valid?
      render action: "confirm"
    else
      binding.pry
      render action: "new"
    end
  end

  def create
    
  end

  private def search_params
    params[:search]&.permit([
      :book_name, :book_subject, :book_type,
      :book_year
    ])
  end

  private def question_params
    params.require(:form).permit(:title, :body, :subject, :book_id)
  end
end
