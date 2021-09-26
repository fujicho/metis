class AnswerPresenter < ModelPresenter
  delegate :body , to: :object

  def posted_at
    "投稿日 " + object.created_at.strftime('%Y/%m/%d')
  end

  def posted_by_badge
    if object.student_member.present?
      "学生"
    else
      "教師"
    end
  end
end