class FormPresenter
  include HtmlBuilder
  
  attr_reader :form_builder, :view_context
  delegate :label, :text_field, :date_field, :password_field,
  :check_box, :radio_button, :text_area, :object, to: :form_builder
  
  def initialize(form_builder,view_context)
    @form_builder = form_builder
    @view_context = view_context
  end

  def error_messages_for(name)
    markup do |m|
      object.errors.full_messages_for(name).each do |message|
        m.div(class: "badge rounded-pill bg-danger") do |m|
          m.text message
        end
      end
    end
  end


  def full_name_block(name1, name2, label_text, options = {})
    markup(:div, class: "col-10 my-2 row") do |m|
      m << decorated_label(name1, label_text, class: "form-label")
      m << text_field( name1, class: "form-control my-2 mx-3 col", placeholder: "性")
      m << text_field( name2, class: "form-control my-2 mx-3 col", placeholder: "名")
      m << error_messages_for(name1)
      m << error_messages_for(name2)
    end
  end

  def full_name_block_kana(name1, name2, label_text, options = {})
    markup(:div, class: "col-10 my-2 row") do |m|
      m << decorated_label(name1, label_text, class: "form-label")
      m << text_field( name1, class: "form-control my-2 mx-3 col", placeholder: "セイ")
      m << text_field( name2, class: "form-control my-2 mx-3 col", placeholder: "メイ")
      m << error_messages_for(name1)
      m << error_messages_for(name2)
    end
  end

  def text_field_block(name, label_text, options= {})
  markup(:div, class: "col-5") do |m|
      m << label(name, label_text, class: options[:required] ? "required" : nil ,class: "form-label mt-2")
      m << text_field(name,options)
      m << error_messages_for(name)
    end
  end
  
  def email_field_block(name, label_text, options= {})
  markup(:div) do |m|
      m << label(name, label_text, class: options[:required] ? "required" : nil ,class: "form-label mt-2")
      m << text_field(name,options)
      m << error_messages_for(name)
    end
  end

  def text_area_block(name, label_text, options= {})
    markup(:div) do |m|
      m << label(name, label_text, class: options[:required] ? "required" : nil ,class: "form-label mt-2")
      m << text_area(name,options)
      m << error_messages_for(name)
    end
  end


  def password_field_block(name,label_text, options = {})
    markup(:div, class: "input-block") do |m|
      m << label(name, label_text,
        class: options[:required] ? "required" : nil, class: "form-label mt-2")
      m << password_field(name, options)
      m << error_messages_for(name)
    end
  end

  def drop_down_list_block(name, label_text, choices, options = {})
    markup(:div, class: "input-block col-5") do |m|
      m << label(name,label_text, class: options[:required] ? "required" : nil, class: "form-label mt-2")
      m << form_builder.select(name, choices, {include_blank: true}, class: "form-select mb-3")
      m << error_messages_for(name)
    end
  end
  
  def postal_code_block(name,label_text,options)
    markup(:div,class: "input-block") do |m|
      m << label(name, label_text, class: options[:required] ? "required" : nil)
      m << text_field(name,options)
      m << error_messages_for(name)
    end
  end

  def decorated_label(name, label_text, options = {})
    label(name,label_text, class: options[:required] ? "required" : nil)
  end
end