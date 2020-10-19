class Admin::SessionsController < Admin::Base
  def new
    if current_administrator
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render aciton: "new"
    end
  end

  def create
    @form = Admin::LoginForm.new(login_form_params)
    if @form.admin_number.present?
      administrator =
        Administrator.find_by(admin_number: @form.admin_number)
    end
    if Admin::Authenticator.new(administrator).authenticate(@form.password)
      session[:administrator_id] = administrator.id
      redirect_to :admin_root
    else
      render action: "new"
    end
  end
  
  def destroy
    session.delete(:administrator_id)
    redirect_to :admin_root
  end

  private def login_form_params
    params.require(:admin_login_form).permit(:admin_number,:password)
  end
end