class Teacher::AccountsController < Teacher::Base
  def show
    @teacher_member = current_teacher_member
  end

  def edit
    @teacher_member = current_teacher_member
  end
end
