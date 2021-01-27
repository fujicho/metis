class Teacher::TopController < Teacher::Base
  skip_before_action :authorize

  def index
    @board_messages = BoardMessage.order(created_at: :desc).limit(5)
    if current_teacher_member
      render action: "dashboard"
    else
      render action: "index"
    end
  end
end
