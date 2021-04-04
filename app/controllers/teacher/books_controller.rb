class Teacher::BooksController < Teacher::Base
  def index
    @books = WorkBook.order(created_at: :desc).all
  end
end
