FactoryBot.define do
  factory:administrator do
    sequence(:admin_number){|n|"00000#{n}"}
    password{"pw"}
    suspended{false}
  end
end