class VueAddressFormPresenter < FormPresenter
  def postal_code_block(name,label_text, options={})
    markup(:div,class: "input-block col-2") do |m|
      m << label(name, label_text, class: "form-label")
      m << text_field(name, class: "form-control", "v-bind:disabled"=>"!able")
      m << error_messages_for(name)
    end
  end

  def drop_down_list_block(name, label_text, choices, options = {})
    markup(:div, class: "input-block col-5") do |m|
      m << label(name,label_text, class: options[:required] ? "required" : nil, class: "form-label mt-2")
      m << form_builder.select(name, choices, {include_blank: true}, class: "form-select mb-3", "v-bind:disabled"=>"!able")
      m << error_messages_for(name)
    end
  end

  def text_field_block(name, label_text, options= {})
    markup(:div, class: "col-5") do |m|
      m << label(name, label_text, class: options[:required] ? "required" : nil ,class: "form-label mt-2")
      m << text_field(name, class:"form-control", "v-bind:disabled"=>"!able")
      m << error_messages_for(name)
    end
  end
end