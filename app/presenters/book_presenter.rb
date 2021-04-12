class BookPresenter < ModelPresenter
  def book_name
    if object.instance_of?(PastBook)
      object.book_name + " " + object.book_subject + "(" + object.book_year.to_s + ")"
    else
      object.book_name
    end
  end
end