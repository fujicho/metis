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

  def assign_attributes(params = {})
    @params = params
    student_member.assign_attributes(student_member_params)
    student_member.home_address.assign_attributes(home_address_params)
    student_member.parents_address.assign_attributes(parents_address_params)
  end

  private def student_member_params
    @params.require(:student_member).permit(
      :student_number,:family_name,:given_name,
      :family_name_kana,:given_name_kana,:gender,:birth_day,:email,:grade,
      :a_class,:password,:emergency_contact,
      :telephone_number,:homeroom_teacher,
      :start_date,:graduation_date,:suspended)
  end

  private def home_address_params
    @params.require(:home_address).permit(
      :postal_code,:prefecture,:city,
      :address1,:address2
    )
  end

  private def parents_address_params
    @params.require(:parents_address).permit(
      :postal_code,:prefecture,:city,
      :address1,:address2
    )
  end

  def save
    ActiveRecord::Base.transaction do
      student_member.save!
      student_member.home_address.save!
      student_member.parents_address.save!
    end
  end
end