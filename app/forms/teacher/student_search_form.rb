class Teacher::StudentSearchForm
  include ActiveModel::Model

  attr_accessor :family_name_kana, :given_name_kana,
    :birth_year, :birth_month, :gender, :grade, :a_class,
    :address_type, :prefecture, :city

  def search
    rel = StudentMember

    if family_name_kana.present?
      rel = rel.where(family_name_kana: family_name_kana)
    end

    if given_name_kana.present?
      rel = rel.where(given_name_kana: given_name_kana)
    end

    rel = rel.where(birth_year: birth_year) if birth_year.present?
    rel = rel.where(birth_year: birth_month) if birth_month.present?
    rel = rel.where(grade: grade) if grade.present?
    rel = rel.where(a_class: a_class) if a_class.present?

    rel.order(:grade, :a_class, :family_name_kana, :given_name_kana, :a_class)
  end
end