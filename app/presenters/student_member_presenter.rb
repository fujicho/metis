class StudentMemberPresenter < ModelPresenter
  delegate :suspended?,:email ,:student_number, :homeroom_teacher,
    :emergency_contact, :telephone_number, :birth_day,
    :bunri ,to: :object

  def suspended_mark
    suspended? ? raw("&#x2611;") : raw("&#x2610;")
  end

  def home_room
    object.grade.to_s + "-" + object.a_class.to_s
  end

  def start_date
    object.start_date.strftime("%Y/%m/%d")
  end

  def graduation_date
    object.graduation_date.try(:strftime,"%Y/%m/%d")
  end

  def birth_day
    object.birth_day.strftime("%Y/%m/%d")
  end
end