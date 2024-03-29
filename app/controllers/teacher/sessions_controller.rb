class Teacher::SessionsController < Teacher::Base
  skip_before_action :authorize
  
  def new
    if current_teacher_member
      redirect_to :teacher_root
    else
      @form = Teacher::LoginForm.new
      render aciton: "new"
    end
  end

  def create
    @form = Teacher::LoginForm.new(login_form_params)
    if @form.email.present?
      teacher_member =
        TeacherMember.find_by("LOWER(email) = ?", @form.email.downcase)
    end
    if Teacher::Authenticator.new(teacher_member).authenticate(@form.password)
      session[:teacher_member_id] = teacher_member.id
      session[:last_access_time] = Time.current
      flash.notice = "ログインしました。"
      redirect_to :teacher_root
    else
      flash.now.alert = "メールアドレスまたはパスワードが正しくありません。"
      render action: "new"
    end
  end
  
  def destroy
    session.delete(:teacher_member_id)
    flash.notice = "ログアウトしました。"
    redirect_to :teacher_root
  end

  private def login_form_params
    params.require(:teacher_login_form).permit(:email, :password)
  end
end