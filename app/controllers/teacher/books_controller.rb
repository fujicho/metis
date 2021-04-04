class Teacher::BooksController < Teacher::Base
  def index
    @book_serch_form = Teacher::BookSearchForm.new
    @books = WorkBook.order(created_at: :desc).all
  end
end
