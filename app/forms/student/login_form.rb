class Student::LoginForm
  include ActiveModel::Model

  attr_accessor :student_number, :password
end