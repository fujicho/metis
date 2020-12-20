class Teacher::StudentForm
  include ActiveModel::Model

  attr_accessor :student_member
  delegate :persisted?, to: :student_member

  def initialize(student_member = nil)
    @student_member = student_member
    @student_member ||= StudentMember.new(gender: "male")
    @student_member.build_home_address unless @student_member.home_address
    @student_member.build_parents_address unless @student_member.parents_address
  end
end