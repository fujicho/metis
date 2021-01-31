class BoardMessagePresenter < ModelPresenter
  delegate :body, :subject, :safe_join, :split, :tag, to: :object

  def contributor
    object.teacher_member.family_name
  end
end