class Teacher::SessionsController < Teacher::Base
  def new
    if current_teacher_member
      redirect_to :teacher_root
    else
      @form = Teacher::LoginForm.new
      render aciton: "new"
    end
  end

  def create
    @form = Teacher::LoginForm.new(params[:teacher_login_form])
    if @form.email.present?
      teacher_member =
        TeacherMember.find_by("LOWER(email) = ?", @form.email.downcase)
    end
    if teacher_member
      session[:teacher_member_id] = teacher_member.id
      redirect_to :teacher_root
    else
      render action: "new"
    end
  end
  
  def destroy
    session.delete(:teacher_member_id)
    redirect_to :teacher_root
  end
end
