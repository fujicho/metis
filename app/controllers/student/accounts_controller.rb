class Student::AccountsController < Student::Base
  def show
    @student_member = current_student_member
  end

  def edit
    @student_form = Student::AccountForm(current_student_member)
  end
end
