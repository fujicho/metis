class TeacherMemberPresenter < ModelPresenter
  delegate :email, :subject, :birthday, :start_date, :homeroom_1, :homeroom_2 ,to: :object

  

end