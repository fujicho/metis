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

    
    if prefecture.present? || city.present?
      case address_type

      when "home" 
        rel = rel.joins(:home_address)
      when "parents"
        rel = rel.joins(:parents_address)
      when ""
        rel = rel.joins(:student_member_addresses)
      else
        raise
      end
      
      if prefecture.present?
        rel = rel.where("student_member_addresses.prefecture" => prefecture)
      end
      
      if city.present?
        rel = rel.where("student_member_addresses.city" => city )
      end
    end
    rel.order(:grade, :a_class, :family_name_kana, :given_name_kana)
  end
end