class FormPresenter
  include HtmlBuilder

  attr_reader :form_builder, :view_context
  delegate :label, :text_field, :date_field, :password_field,
    :check_box, :radio_button, :text_area, :object, to: :form_builder

  def initialize(form_builder,view_context)
    @form_builder = form_builder
    @view_context = view_context
  end

  def text_field_block(name, label_text, options= {})
    markup(:div) do |m|
    m << label(name, label_text, class: options[:required] ? "required" : nil)
    m << text_field(name,options)
    end
  end
end