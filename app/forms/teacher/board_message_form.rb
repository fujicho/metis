class Teacher::BoardMessageForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  BOARD_TAGS = %w(全体 文系 理系)

  attr_accessor :board_message
  delegate :valid?, :save, to: :board_message

  attribute :subject, :string
  attribute :body, :string
  attribute :tag, :string

  validates :subject, presence: true, length: {maximum: 80}
  validates :body, presence: true, length: {maximum: 800}
  validates :tag, inclusion: { in: BOARD_TAGS, presence: true }

  def initialize(teacher_member, board_message, params = {})
    @teacher_member = teacher_member
    @board_message = board_message
    super(params)
  end
end