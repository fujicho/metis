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

  def text_field_block(name, label_text, options= {})
  markup(:div, class: "col-5") do |m|
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
        class: options[:required] ? "required" : nil, class: "form-label")
      m << password_field(name, options)
      m << error_messages_for(name)
    end
  end

  def drop_down_list_block(name, label_text, choices, options = {})
    markup(:div, class: "input-block col-4") do |m|
      m << label(name,label_text, class: options[:required] ? "required" : nil, class: "form-label mt-2")
      m << form_builder.select(name, choices, {include_blank: true}, class: "form-select")
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