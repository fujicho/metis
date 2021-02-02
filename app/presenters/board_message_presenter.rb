class BoardMessagePresenter < ModelPresenter
  delegate :body, :subject, :tag, to: :object

  def contributor
    object.teacher_member.family_name
  end
end