class Teacher::Authenticator
  def initialize(teacher_member)
    @teacher_member = teacher_member
  end

  def authenticate(raw_password)
    @teacher_member &&
      !@teacher_member.suspended? &&
      @teacher_member.hashed_password &&
      @teacher_member.start_date <= Date.today &&
      (@teacher_member.end_date.nil? ||  @teacher_member.end_date > Date.today) &&
      BCrypt::Password.new(@teacher_member.hashed_password) == raw_password
  end
end