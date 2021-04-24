class BookPresenter < ModelPresenter
  def book_name
    if object.book_type == "past"
      object.book_name + " " + object.book_subject + "(" + object.book_year.to_s + ")"
    elsif object.book_type == "work"
      object.book_name
    else
      object.book_name
    end
  end
end