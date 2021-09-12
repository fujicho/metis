class StudentMemberFormPresenter < FormPresenter

  def full_name_block(name1, name2, label_text, options = {})
    markup(:div, class: "my-2 col-3") do |m|
      m << decorated_label(name1, label_text, class: "form-label")
      m << text_field( name1, class: "form-control my-2")
      m << text_field( name2, class: "form-control my-2")
      m << error_messages_for(name1)
      m << error_messages_for(name2)
    end
  end

  def suspended_check_box
    markup(:div) do |m|
      m << check_box(:suspended)
      m << label(:suspended, "アカウント停止")
    end
  end

  def date_field_block(name, label_text, options = {})
    markup(:div) do |m|
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
      m << label(:gender,"性別")
      m << radio_button(:gender, "male")
      m << label(:gender, "男性")
      m << radio_button(:gender, "female")
      m << label(:gender, "女性")
    end
  end
end