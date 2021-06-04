class Question < ApplicationRecord
  belongs_to :book, dependent: :destroy
  belongs_to :student_member, dependent: :destroy
  has_many :answers, dependent: :restrict_with_exception

  validates :title, :body, presence: :true

  paginates_per 5

end