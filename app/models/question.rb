class Question < ApplicationRecord
  belongs_to :book, dependent: :destroy
  belongs_to :student_member
  has_many :answers
end
