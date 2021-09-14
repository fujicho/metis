class QuestionPresenter < ModelPresenter
  delegate :title , :body, to: :object

  def book_name
    if object.book.book_type == "past"
      object.book.book_name + "(" + object.book.book_year + ")" 
    else
      object.book.book_name 
    end
  end

  def posted_at
    "投稿日 " + object.created_at.strftime('%Y/%m/%d %H:%M')
  end
end