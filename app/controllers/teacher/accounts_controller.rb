class Teacher::AccountsController < Teacher::Base
  def show
    @teacher_member = current_teacher_member
  end

  def edit
    @teacher_member = current_teacher_member
  end

  private def teacher_member_params
    params.require(:teacher_member).permit( :email, :family_name, :given_name, 
      :family_name_kana, :given_name_kana)
  end
end
