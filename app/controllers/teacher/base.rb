class Teacher::Base < ApplicationController
  before_action :authorize
  before_action :check_account
  before_action :check_timeout

  private def authorize
    unless current_teacher_member
      redirect_to :teahcer_login
    end
  end

  private def current_teacher_member
    if session[:teacher_member_id]
      @current_teacher_member ||=
        TeacherMember.find_by(id: session[:teacher_member_id])
    end
  end

  private def check_account
    if current_teacher_member && !current_teacher_member.active?
      redirect_to :teacher_root
    end
  end


  TIMEOUT = 60.minutes

  private def check_timeout
    if current_teacher_member 
      if session[:last_access_time] >= TIMEOUT.ago
        session[:last_access_time] = Time.current
      else
        session.delete(:teacher_member_id)
        redirect_to :teahcer_login
      end
    end
  end

  helper_method :current_teacher_member
end