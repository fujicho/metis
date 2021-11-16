class Student::Base < ApplicationController
  before_action :authorize
  before_action :check_account
  
  private def authorize
    unless current_student_member
      redirect_to :student_login
    end
  end

  private def current_student_member
    if student_member_id = cookies.signed[:student_member_id] || session[:student_member_id]
      @current_student_member ||= StudentMember.find_by(id: student_member_id)
    end
  end

  private def check_account
    if current_student_member && !current_student_member.active?
      session.delete(:student_member_id)
      redirect_to :student_root
    end
  end

  private def check_guest
    if current_student_member.guest
      redirect_to :student_root
      flash.notice = "この機能はゲストアカウントではご利用できません。"
    end
  end

  helper_method :current_student_member
end