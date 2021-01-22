class Student::AccountsController < Student::Base
  def show
    @student_member = current_student_member
  end

  def edit
    @student_form = Student::AccountForm.new(current_student_member)
  end

  def update
    @student_form = Student::AccountForm.new(current_student_member)
    @student_form.assign_attributes(params[:form])
    if @student_form.save
      redirect_to :student_root
    else
      render action: "edit"
    end
  end

  def confirm
    @student_form = Student::AccountForm.new(current_student_member)
    @student_form.assign_attributes(params[:form])
    if @student_form.valid?
      render action: "confirm"
    else
      render action: "edit"
    end
  end
end
