class Teacher::BooksController < Teacher::Base
  def index
    @book_search_form = Teacher::BookSearchForm.new(search_params)
    @books = @book_search_form.search.page(params[:page])
  end

  def new
    @book_form = Teacher::BookForm.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book_form = Teacher::BookForm.new
    @book_form.assign_attributes(params[:form])
    if @book_form.save
      redirect_to action: "index"
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
      :book_name, :book_subject, :type,
      :book_year
    ])
  end
end