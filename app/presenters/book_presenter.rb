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

  def type
    if object.book_type == "past"
      "過去問"
    elsif object.book_type == "work"
      "参考書、問題集"
    else
      nil
    end
  end
end