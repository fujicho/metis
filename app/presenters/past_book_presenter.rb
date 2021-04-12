class PastBookPresenter < ModelPresenter
  def book_name
    object.book_name + " " + object.book_subject + "(" + object.book_year.to_s + ")"
  end
end