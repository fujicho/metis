class Student::LoginForm
  include ActiveModel::Model

  attr_accessor :student_number, :password, :remember_me

  def remember_me?
    remember_me == "1"
  end
end