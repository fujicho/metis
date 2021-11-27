class BoardMessage < ApplicationRecord
  include StringNormalizer

  belongs_to :teacher_member

  BOARD_TAGS = %w(全体 文系 理系)
  
  validates :subject, presence: true, length: {maximum: 80}
  validates :body, presence: true, length: {maximum: 800}
  validates :tag, inclusion: { in: BOARD_TAGS, presence: true }
  
  before_validation do
    self.subject = normalize_as_text(subject)
    self.body = normalize_as_text(body)
  end
end
