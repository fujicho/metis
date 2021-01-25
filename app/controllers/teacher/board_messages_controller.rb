class Teacher::BoardMessagesController < Teacher::Base
  def index
    @board_messages = BoardMessage.order(occurred_at: :desc)
  end

  def new
    @board_message = BoardMessage.new
  end

  private def board_message_params
    params.require(:board_message).permit(:subject, :body, :tag)
  end
end
