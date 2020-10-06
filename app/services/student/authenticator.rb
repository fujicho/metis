class Student::Authenticator
  def initialize(student_member)
    @student_member = student_member
  end

  def authenticate(raw_password)
    @student_member &&
      !@student_member.suspended? &&
      @student_member.hashed_password &&
      @student_member.start_date <= Date.today &&
      (@student_member.graduation_date.nil? || @student_member.graduation_date > Date.today) &&
      BCrypt::Password.new(@student_member.hashed_password) == raw_password
  end
end