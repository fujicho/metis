class Answer < ApplicationRecord
  belongs_to :question, dependent: :destroy
  belongs_to :teacher_member
  belongs_to :student_member

  validates :body, presence: true length: { maxmmum: 800 }
end
