class Teacher::BoardMessagesController < Teacher::Base
  def index
    @board_messages = BoardMessage.order(occurred_at: :desc)
  end

  def new
    @board_message = BoardMessage.new
  end
  
  def confirm
    @board_message = BoardMessage.new(board_message_params)
    @board_message.teacher_member = current_teacher_member
    if @board_message.valid?
      render action: "confirm"
    else
      render action: "new"
    end
  end

  private def board_message_params
    params.require(:board_message).permit(:subject, :body, :tag)
  end

end
