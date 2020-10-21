class Teacher::Base < ApplicationController
  before_action :authorize

  private def authorize
    unless current_teacher_member
      redirect_to :teahcer_login
  end

  private def current_teacher_member
    if session[:teacher_member_id]
      @current_teacher_member ||=
        TeacherMember.find_by(id: session[:teacher_member_id])
    end
  end

  helper_method :current_teacher_member
end