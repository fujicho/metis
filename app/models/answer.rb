class Answer < ApplicationRecord
  include StringNormalizer
  belongs_to :question, dependent: :destroy
  belongs_to :teacher_member, optional: true
  belongs_to :student_member, optional: true

  before_validation do
    self.body = normalize_as_text(body)
  end

  validates :body, presence: true, length: { maximum: 800 }
end
