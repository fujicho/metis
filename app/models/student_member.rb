class StudentMember < ApplicationRecord
  has_many :events, class_name: "StudentEvent", dependent: :destroy
  has_one :parents_address, dependent: :destroy, autosave: true
  has_one :home_address, dependent: :destroy, autosave: true

  include StringNormalizer
  include PersonalNameHolder
  include EmailHolder

  before_validation do
    self.student_number = normalize_as_id_number(student_number)
    self.emergency_contact = normalize_as_id_number(emergency_contact)
  end


  KATAKANA_REXAP = /\A[\p{katakana}\u{30fc}]+\z/
  HUMAN_NAME_REXAP = /\A[\p{han}\p{hiragana}\p{katakana}\u{30fc}A-Za-z]+\z/

  validates :birth_day, date: {before: ->(obj) { Date.today }, presence: true}
  validates :gender, inclusion: { in: %w(male female), presence: true}
  validates :emergency_contact, :grade, :a_class ,
    :gender,:telephone_number, :homeroom_teacher, :start_date, presence: true
  validates :student_number, :email, uniqueness: true, presence: true

  def password=(raw_password)
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
  end

  def active?
    !suspended? && start_date <= Date.today &&
    ( graduation_date.nil? || graduation_date > Date.today)
  end

end
