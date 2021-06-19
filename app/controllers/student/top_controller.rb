class Student::TopController < Student::Base
  skip_before_action :authorize
  
  def index
    if current_student_member
      @board_messages = BoardMessage.order(created_at: :desc).where(tag: [current_student_member.bunri, "全体"]).limit(5).includes(:teacher_member)
      render action: "index"
    else
      redirect_to student_login_url
    end
  end
end
