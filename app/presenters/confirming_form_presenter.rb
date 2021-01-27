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
    markup(:div) do |m|
      if options[:disabled]
        m.div(object.send(name))
      else
        m.div(object.send(name))
        m << hidden_field(name, options)
      end
    end
  end

  def date_field_block(name, label_text, options= {})
    markup(:div) do |m|
      m.div(object.send(name))
      m << hidden_field(name, options)
    end
  end

  def drop_down_list_block(name, label_text, choices, options = {})
    markup(:div) do |m|
      m.div(object.send(name))
      m << hidden_field(name, options)
    end
  end

  def text_area_block(name, label_text, options = {})
    markup(:div) do |m|
      value = object.send(name)
      m.div do
        m << ERB::Util.html_escape(value).gsub(/\n/, "<br>")
      end
      m << hidden_field(name, options)
    end
  end
end