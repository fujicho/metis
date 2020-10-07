class Student::SessionsController < Student::Base
  def new
    if current_student_member
      redirect_to :student_root
    else
      @form = Student::LoginForm.new
      render aciton: "new"
    end
  end

  def create
    @form = Student::LoginForm.new(params[:student_login_form])
    if @form.student_number.present?
      student_member =
        StudentMember.find_by(student_number: @form.student_number)
    end
    if Student::Authenticator.new(student_member).authenticate(@form.password)
      session[:student_member_id] = student_member.id
      redirect_to :student_root
    else
      render action: "new"
    end
  end
  
  def destroy
    session.delete(:student_member_id)
    redirect_to :student_root
  end
end