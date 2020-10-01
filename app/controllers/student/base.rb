class Student::Base < ApplicationController
  private def current_student_member
    if session[:student_member_id]
      @current_student_member ||=
        StudentMember.find_by(id: session[:student_member_id])
    end
  end

  helper_method :current_student_member
end