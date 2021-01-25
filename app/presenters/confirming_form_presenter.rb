class ConfirmingFormPresenter
  include HtmlBuilder

  attr_reader :form_builder, :view_context
  delegate :label, :hidden_field, :object, to: :form_builder
  
  def initialize(form_builder, view_context)
    @form_builder = form_builder
    @view_context = view_context
  end

  def notes
    ""
  end

  def text_field_block(name, label_text, options = {})
    
  end
end