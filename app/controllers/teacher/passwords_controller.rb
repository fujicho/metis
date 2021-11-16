class Teacher::PasswordsController < Teacher::Base
  def show
    redirect_to :edit_teacher_password
  end

  def edit
    @change_password_form = 
      Teacher::ChangePasswordForm.new(object: current_teacher_member)
  end

  def update
    check_guest
    @change_password_form = Teacher::ChangePasswordForm.new(teacher_member_params)
    @change_password_form.object = current_teacher_member
    if @change_password_form.save
      redirect_to :teacher_account
    else
      render action: "edit"
    end
  end

  private def teacher_member_params
    params.require(:teacher_change_password_form).permit(
      :current_password, :new_password, :new_password_confirmation
    )
  end
end
