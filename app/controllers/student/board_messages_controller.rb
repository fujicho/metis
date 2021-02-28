class Student::BoardMessagesController < Student::Base

  def index
    @board_messages = BoardMessage.order(created_at: :desc).where(tag: [current_student_member.bunri, "全体"]).limit(5).includes(:teacher_member)
    render action: "index"
  end
end
