class Teacher::BooksController < Teacher::Base
  def index
    @book_search_form = Teacher::BookSearchForm.new(search_params)
    @books = @book_search_form.search.page(params[:page])
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to :teacher_books
    else
      render action: "new"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy!
    redirect_to :teacher_books
  end

  private def search_params
    params[:search]&.permit([
      :book_name, :book_subject, :book_type,
      :book_year
    ])
  end

  private def book_params
    params.require(:form).permit(:book_name, :book_subject,
    :book_year, :book_type)
  end
end