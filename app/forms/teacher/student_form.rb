class Teacher::StudentForm
  include ActiveModel::Model

  attr_accessor :student_member, :inputs_home_address, :inputs_parents_address
  delegate :persisted?, :save, to: :student_member

  def initialize(student_member = nil)
    @student_member = student_member
    @student_member ||= StudentMember.new(gender: "male")
    @student_member.build_home_address unless @student_member.home_address
    @student_member.build_parents_address unless @student_member.parents_address
    self.inputs_home_address = @student_member.home_address.present?
    self.inputs_parents_address = @student_member.parents_address.present?
  end

  def assign_attributes(params = {})
    @params = params
    self.inputs_home_address = params[:inputs_home_address] == "1"
    self.inputs_parents_address = params[:inputs_parents_address] == "1"
    student_member.assign_attributes(student_member_params)

    if inputs_home_address
      student_member.home_address.assign_attributes(home_address_params)
    else
      student_member.home_address.mark_for_destruction
    end

    if inputs_parents_address
      student_member.parents_address.assign_attributes(parents_address_params)
    else
      student_member.parents_address.mark_for_destruction
    end

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
    student_member.save
  end
end