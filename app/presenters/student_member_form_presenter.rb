class StudentMemberFormPresenter < FormPresenter

  def text_field_block(name, label_text, options = {})
    markup(:div) do |m|
      m << label(name, label_text, class: options[:required] ? "required" : nil)
      m << text_field(name,options)
      m << error_messages_for(name)
    end
  end
  
  def full_name_block(name1, name2, label_text, options = {})
    markup(:div) do |m|
      m << label(name1, label_text, class: options[:required] ? "required" : nil)
      m << text_field( name1, options)
      m << text_field( name2, options)
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
      m << label(name, label_text, class: options[:required] ? "required" : nil)
      m << date_field(name,options)
      m << error_messages_for(name)
    end
  end
  
  def password_field_block(name, label_text, options = {})
    markup(:div) do |m|
      m << label(name, label_text, class: options[:required] ? "required" : nil)
      m << password_field(name,options)
      m << error_messages_for(name)
    end
  end
end