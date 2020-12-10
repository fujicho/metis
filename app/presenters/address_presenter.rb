class AddressPresenter < ModelPresenter
  delegate :prefecture, :city, :address1, :address2, to: :object

  def postal_code
    if pos = object.postal_code.match(/\A(\d{3})(\d{4})\z/)
      pos[1] + "-" + pos[2]
    else
      object.postal_code
    end
  end
end