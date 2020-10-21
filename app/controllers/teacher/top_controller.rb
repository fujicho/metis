class Teacher::TopController < Teacher::Base
  skip_before_action :authorize

  def index
    if current_teacher_member
      render action: "dashboard"
    else
      render action: "index"
    end
  end
end
