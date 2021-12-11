class TeacherMember < ApplicationRecord
  has_one :address, dependent: :destroy
  has_many :answers, dependent: :destroy
  
  include StringNormalizer
  include PersonalNameHolder
  include EmailHolder
  include PasswordHolder

  validates :birthday, date: {before: ->(obj) { Date.today }, presence: true}
  validates :email, uniqueness: true, presence: true

  def active?
    !suspended? && start_date <= Date.today &&
    ( end_date.nil? || end_date > Date.today)
  end
end