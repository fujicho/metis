class StudentMemberPresenter < ModelPresenter
  delegate :suspended?,:email, to: :object

  def suspended_mark
    suspended? ? raw("&#x2611;") : raw("&#x2610;")
  end

  def full_name
    object.family_name + " " + object.given_name
  end

  def full_name_kana
    object.family_name_kana + " " + object.given_name_kana
  end

  def gender
    case object.gender
    when "male"
      "男性"
    when "female"
      "女性"
    else
      ""
    end
  end

  def home_room
    object.grade.to_s + "-" + object.a_class.to_s
  end

end