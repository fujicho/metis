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
    "投稿日 " + object.created_at.strftime('%Y/%m/%d')
  end

  def posted_by
    object.student_member.family_name + " " + object.student_member.given_name + "(" + object.student_member.grade.to_s + "-" + object.student_member.a_class.to_s + ")"
  end
end