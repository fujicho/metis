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

  def create
    @board_message = BoardMessage.new(board_message_params)
    if params[:commit]
      @board_message.teacher_member = current_teacher_member
      if @board_message.save
        redirect_to :teacher_root
      else
        render action: "new"
      end
    else
      render action: "new"
    end
  end

  def edit
    @board_message = BoardMessage.find(params[:id])
  end

  def update
    @board_message = BoardMessage.find(params[:id])
    @board_message.assign_attributes(board_message_params)
    if @board_message.save
      redirect_to :teacher_root
    else
      render action: "edit"
    end
  end

  def destroy
    board_message = BoardMessage.find(params[:id])
    board_message.destroy!
    redirect_to :teacher_root
  end

  private def board_message_params
    params.require(:board_message).permit(:subject, :body, :tag)
  end
end
