class Teacher::BoardMessagesController < Teacher::Base
  def index
    @board_messages = BoardMessage.order(created_at: :desc)
    @board_messages = @board_messages.page(params[:page]).includes(:teacher_member)
  end

  def new
    @board_message = BoardMessage.new
    @board_form = Teacher::BoardMessageForm.new(current_teacher_member ,@board_message)
  end

  def confirm
    @board_message = BoardMessage.new(board_message_params)
    @board_form = Teacher::BoardMessageForm.new(current_teacher_member ,@board_message, board_message_params)
    @board_message.teacher_member = current_teacher_member
    if @board_message.valid?
      render action: "confirm"
    else
      render action: "new"
    end
  end

  def create
    @board_message = BoardMessage.new(board_message_params)
    @board_form = Teacher::BoardMessageForm.new(current_teacher_member ,@board_message, board_message_params)
    if params[:commit]
      @board_message.teacher_member = current_teacher_member
      if @board_form.save
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

  # def edit
  #   @board_message = BoardMessage.find(params[:id])
  # end
  def edit_confirm
    @board_message = BoardMessage.find(params[:board_message_id])
    @board_form = Teacher::BoardMessageForm.new(current_teacher_member, @board_message, board_message_params)
    if @board_form.update(board_message_params)
      render action: "edit_confirm"
    else
      render action: "edit"
    end
  end

  def update
    @board_message = BoardMessage.find(params[:id])
    @board_form = Teacher::BoardMessageForm.new(current_teacher_member, @board_message, board_message_params)
    if params[:commit]
      if @board_form.update(board_message_params)
        redirect_to :teacher_root
      else
        render action: "edit"
      end
    else
      render action: "edit"
    end
  end
  # def edit_confirm
  #   @board_message = BoardMessage.find(params[:board_message_id])
  #   @board_message.update_attributes(board_message_params)
  #   if @board_message.valid?
  #     render action: "edit_confirm"
  #   else
  #     render action: "new"
  #   end
  # end
  
  # def update
  #   @board_message = BoardMessage.find(params[:id])
  #   @board_message.update_attributes(board_message_params)
  #   if params[:commit]
  #     @board_message.save
  #     redirect_to :teacher_root
  #   else
  #     render action: "edit"
  #   end
  # end

  def destroy
    board_message = BoardMessage.find(params[:id])
    board_message.destroy!
    redirect_to :teacher_root
  end

  private def board_message_params
    params.require(:form).permit(:subject, :body, :tag)
  end
end
