class Teacher::StudentSearchForm
  include ActiveModel::Model
  include StringNormalizer

  attr_accessor :student_number, :family_name_kana, :given_name_kana,
    :telephone_number, :emergency_contact,
    :birth_year, :birth_month, :gender, :grade, :a_class,
    :address_type, :prefecture, :city

  def search
    normalize_values

    rel = StudentMember

    if student_number.present?
      rel = rel.where(student_number: student_number)
    end

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
    rel = rel.where(telephone_number: telephone_number) if telephone_number.present?
    rel = rel.where(emergency_contact: emergency_contact) if emergency_contact.present?


    
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

  private def normalize_values
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana = normalize_as_furigana(given_name_kana)
    self.city = normalize_as_name(city)
    self.student_number = normalize_as_id_number(student_number)
    self.telephone_number = normalize_as_phone_number(telephone_number)
    self.emergency_contact = normalize_as_phone_number(emergency_contact)
  end
end