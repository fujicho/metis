class Teacher::BoardMessageForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  
  attribute :subject, :string
  attribute :body, :string
  attribute :tag, :string
  attr_accessor :board_message, :subject, :body, :tag

  delegate :persisted?, :valid?, :save, to: :board_message

  def initialize(teacher_member, board_message, params = {})
    @teacher_member = teacher_member
    @board_message = board_message
    super(params)
  end

  def save
    board_message.save
  end
end