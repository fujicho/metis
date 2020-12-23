FactoryBot.define do
  factory :home_address do
    postal_code { "1111111"}
    prefecture { "東京都" }
    city { "中央区" }
    address1 { "てすと1-1" }
    address2 { "" }
  end

  factory :parents_address do
    postal_code { "22222222"}
    prefecture { "北海道" }
    city { "豊平区" }
    address1 { "おすし1-1" }
    address2 { "" }
  end
end