class Student::BooksController < Student::Base
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @question = @book.questions
  end
end
