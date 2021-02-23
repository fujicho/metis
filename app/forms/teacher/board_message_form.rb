class Teacher::BoardMessageForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  
  attribute :subject, :string
  attribute :body, :string
  attribute :tag, :string
  attr_accessor :board_message, :subject, :body, :tag

  delegate :persisted?, :valid?, :save, :update, to: :board_message

  def initialize(teacher_member,message, params = {})
    @teacher_member = teacher_member
    @board_message = message
    super(params)
  end

  def save
    @board_message.save
  end

  def update(params)
    @board_message.update(params)
  end

  # def assign_attributes(params = {})
  #   board_message.assign_attributes(params)
  # end
end