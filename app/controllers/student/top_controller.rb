class Student::TopController < Student::Base
  skip_before_action :authorize
  
  def index
    @board_messages = BoardMessage.order(created_at: :desc).limit(5)
    render action: "index"
  end
end
