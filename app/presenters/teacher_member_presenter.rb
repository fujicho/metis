class TeacherMemberPresenter < ModelPresenter
  delegate :email, to: :object
end