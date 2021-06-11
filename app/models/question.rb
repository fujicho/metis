class Question < ApplicationRecord
  belongs_to :book, dependent: :destroy
  belongs_to :student_member, dependent: :destroy
  has_many :answers, dependent: :restrict_with_exception

  validates :title, :body, presence: :true

  before_validation do
    self.title = normalize_as_text(title)
    self.body = normalize_as_text(body)
  end

  paginates_per 5
end