class TeacherMember < ApplicationRecord
  include StringNormalizer
  include PersonalNameHolder
  include EmailHolder
  include PasswordHolder

  has_one :address, dependent: :destroy
  
  

  def active?
    !suspended? && start_date <= Date.today &&
    ( end_date.nil? || end_date > Date.today)
  end
end
