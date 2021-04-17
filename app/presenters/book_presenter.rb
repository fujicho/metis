class BookPresenter < ModelPresenter
  def book_name
    if object.instance_of?(PastBook)
      object.book_name + " " + object.book_subject + "(" + object.book_year.to_s + ")"
    elsif object.instance_of?(WorkBook)
      object.book_name
    else
      object.book_name
    end
  end
end