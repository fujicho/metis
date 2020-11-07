class StudentMember < ApplicationRecord
  include StringNormalizer

  has_many :events, class_name: "StudentEvent", dependent: :destroy

  before_validation do
    self.family_name = normalize_as_name(family_name)
    self.given_name = normalize_as_name(given_name)
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana = normalize_as_furigana(given_name_kana)
    self.student_number = normalize_as_id_number(student_number)
  end


  KATAKANA_REXAP = /\A[\p{katakana}\i{30fc}]+\z/

  validates :family_name, :given_name, presence: true
  validates :family_name_kana, :given_name_kana, presence: true,
    format: { with: KATAKANA_REXAP, allow_blank: true }

  def password=(raw_password)
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
  end

  def active?
    !suspended? && start_date <= Date.today &&
    ( graduation_date.nil? || end_date > Date.today)
  end

end
