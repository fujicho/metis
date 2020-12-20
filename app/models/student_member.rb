class StudentMember < ApplicationRecord
  has_many :events, class_name: "StudentEvent", dependent: :destroy
  has_one :parents_address, dependent: :destroy
  has_one :home_address, dependent: :destroy

  include StringNormalizer

  before_validation do
    self.family_name = normalize_as_name(family_name)
    self.given_name = normalize_as_name(given_name)
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana = normalize_as_furigana(given_name_kana)
    self.student_number = normalize_as_id_number(student_number)
    self.emergency_contact = normalize_as_id_number(emergency_contact)
  end


  KATAKANA_REXAP = /\A[\p{katakana}\u{30fc}]+\z/
  HUMAN_NAME_REXAP = /\A[\p{han}\p{hiragana}\p{katakana}\u{30fc}A-Za-z]+\z/

  validates :family_name, :given_name, presence: true,
    format: { with: HUMAN_NAME_REXAP, allow_blank: true}
  validates :family_name_kana, :given_name_kana, presence: true,
    format: { with: KATAKANA_REXAP, allow_blank: true }
  validates :emergency_contact, :grade, :a_class ,
    :gender, :birth_day, :telephone_number, :homeroom_teacher, :start_date, presence: true
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
