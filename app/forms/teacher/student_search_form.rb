class Teacher::StudentSearchForm
  include ActiveModel::Model

  attr_accessor :family_name_kana, :given_name_kana,
    :birth_year, :birth_month, :gender, :grade, :a_class
end