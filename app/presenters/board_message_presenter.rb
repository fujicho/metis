class BoardMessagePresenter < ModelPresenter
  delegate :body, :subject, :tag, to: :object

  def contributor
    object.teacher_member.family_name
  end

  def posted_at
    "投稿日 " + object.created_at.strftime('%Y/%m/%d')
  end
end