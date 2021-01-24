class Teacher::BoardMessagesController < Teacher::Base
  def index
    @board_messages = BoardMessage.order(occurred_at: :desc)
  end

  def new
    @board_message = BoardMessage.new
  end
end
