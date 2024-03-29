class Teacher::TopController < Teacher::Base
  skip_before_action :authorize

  def index
    @board_messages = BoardMessage.order(created_at: :desc).limit(5).includes(:teacher_member)
    if current_teacher_member
      render action: "dashboard"
    else
      redirect_to teacher_login_path
    end
  end
end
