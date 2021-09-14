class QuestionPresenter < ModelPresenter

  def book_name
    if object.book.book_type == "past"
      object.book.book_name + "(" + object.book.book_year + ")" 
    else
      object.book.book_name 
    end
  end
end