class Teacher::StudentMembersController < Teacher::Base
  def index
    @student_members = StudentMember.order(:family_name_kana,:given_name_kana)
  end
end
