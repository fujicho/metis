class StudentMemberPresenter < ModelPresenter
  delegate :suspended?,:email, to: :object

  def suspended_mark
    suspended? ? raw("&#x2611;") : raw("&#x2610;")
  end


  def home_room
    object.grade.to_s + "-" + object.a_class.to_s
  end

end