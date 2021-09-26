class StudentMemberFormPresenter < FormPresenter

  def suspended_check_box
    markup(:div) do |m|
      m << check_box(:suspended)
      m << label(:suspended, "アカウント停止")
    end
  end

  def date_field_block(name, label_text, options = {})
    markup(:div, class: "col-6") do |m|
      m << decorated_label(name, label_text, options)
      m << date_field(name,options)
      m << error_messages_for(name)
    end
  end
  
  def password_field_block(name, label_text, options = {})
    markup(:div) do |m|
      m << decorated_label(name, label_text, options)
      m << password_field(name,options)
      m << error_messages_for(name)
    end
  end

  def gender_field_block
    markup(:div, class: "radio-buttons mb-2") do |m|
      m << label(:gender, "性別")
      m << radio_button(:gender, "male", class: "form-check-input mx-2")
      m << label(:gender_male, "男性", class: "form-check-label")
      m << radio_button(:gender, "female", class: "form-check-input mx-2")
      m << label(:gender_female, "女性")
    end
  end
end