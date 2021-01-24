class BoardMessage < ApplicationRecord
  belongs_to :teacher_member

  BOARD_TAGS = %w(文系 理系 全体)

  validates :subject, presence: true, length: {maximum: 80}
  validates :body, presence: true, length: {maximum: 80}
  validates :tag, inclusion: { in: BOARD_TAGS, presence: true }
end
