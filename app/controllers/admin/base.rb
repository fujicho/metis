class Admin::Base < ApplicationController
  before_action :authorize

  private def authorize
    unless current_administrator
      redirect_to :admin_login
    end
  end

  private def current_administrator
    if session[:administrator_id]
      @current_administrator ||=
        Administrator.find_by(id: session[:administrator_id])
    end
  end

  helper_method :current_administrator
end