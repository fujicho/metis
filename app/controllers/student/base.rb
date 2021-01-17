class Student::Base < ApplicationController
  before_action :authorize
  before_action :check_account
  before_action :check_timeout
  
  private def authorize
    unless current_student_member
      redirect_to :student_login
    end
  end

  private def current_student_member
    if student_member_id = cookies.signed[:student_member_id] || session[:student_member_id]
      @student_member ||= StudentMember.find_by(id: student_member_id)
    end
  end

  private def check_account
    if current_student_member && !current_student_member.active?
      redirect_to :student_root
    end
  end

  TIMEOUT = 60.minutes

  private def check_timeout
    if current_student_member 
      if session[:last_access_time] >= TIMEOUT.ago
        session[:last_access_time] = Time.current
      else
        session.delete(:student_member_id)
        redirect_to :student_login
      end
    end
  end

  helper_method :current_student_member
end