class Answer < ApplicationRecord
  belongs_to :question, dependent: :destroy
  belongs_to :teacher_member, optional: true
  belongs_to :student_member, optional: true

  validates :body, presence: true, length: { maximum: 800 }
end
