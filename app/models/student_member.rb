class StudentMember < ApplicationRecord
  has_many :events, class_name: "StudentEvent", dependent: :destroy
  has_many :student_member_addresses, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_one :parents_address, dependent: :destroy, autosave: true
  has_one :home_address, dependent: :destroy, autosave: true


  include StringNormalizer
  include PersonalNameHolder
  include EmailHolder
  include PasswordHolder

  before_validation do
    self.student_number = normalize_as_id_number(student_number)
    self.emergency_contact = normalize_as_id_number(emergency_contact)
  end


  KATAKANA_REXAP = /\A[\p{katakana}\u{30fc}]+\z/
  HUMAN_NAME_REXAP = /\A[\p{han}\p{hiragana}\p{katakana}\u{30fc}A-Za-z]+\z/

  validates :birth_day, date: {before: ->(obj) { Date.today }, presence: true}
  validates :gender, inclusion: { in: %w(male female), presence: true}
  validates :grade, :a_class ,
    :gender, :homeroom_teacher, :start_date, presence: true
  validates :student_number, :email, uniqueness: true, presence: true
  validates :telephone_number, presence: true,
    format: { with: /\A\+?\d+(-\d+)*\z/, allow_blank: true}

  before_save do
    if birth_day
      self.birth_year = birth_day.year
      self.birth_month = birth_day.month
      self.birth_mday = birth_day.mday
    end
  end
  
  def active?
    !suspended? && start_date <= Date.today &&
    ( graduation_date.nil? || graduation_date > Date.today)
  end

end
