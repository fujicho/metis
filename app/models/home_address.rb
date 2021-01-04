class HomeAddress < StudentMemberAddress
  validates :postal_code, :prefecture, :city, :address1, presence: true
end