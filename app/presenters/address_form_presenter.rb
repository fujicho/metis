class AddressFormPresenter < FormPresenter
  def postal_code_block(name,label_text, options={})
    markup(:div,class: "input-block col-2") do |m|
      m << label(name, label_text, class: "form-label")
      m << text_field(name, class: "form-control")
      m << error_messages_for(name)
    end
  end
end