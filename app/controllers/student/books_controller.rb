class Student::BooksController < Student::Base
  def show
    @book = Book.find(params[:id])
    @question = @book.questions
  end
end
