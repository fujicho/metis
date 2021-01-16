class Student::SessionsController < Student::Base
  skip_before_action :authorize

  def new
    if current_student_member
      redirect_to :student_root
    else
      @form = Student::LoginForm.new
      render aciton: "new"
    end
  end

  def create
    @form = Student::LoginForm.new(login_form_params)
    if @form.student_number.present?
      student_member =
        StudentMember.find_by(student_number: @form.student_number)
    end
    if Student::Authenticator.new(student_member).authenticate(@form.password)
      if @form.remember_me?
        cookies.permanent.signed[:student_member_id] = student_member.id
      else
        cookies.delete(:student_member_id)
        session[:student_member_id] = student_member.id
      end
      session[:last_access_time] = Time.current
      student_member.events.create!(type: "logged_in")
      redirect_to :student_root
    else
      render action: "new"
    end
  end
  
  def destroy
    if current_student_member
      current_student_member.events.create!(type: "logged_out")
    end
    cookies.delete(:student_member_id)
    session.delete(:student_member_id)
    redirect_to :student_root
  end

  private def login_form_params
    params.require(:student_login_form).permit(:student_number, :password, :remember_me)
  end
end