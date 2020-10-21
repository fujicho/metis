FactoryBot.define do
  factory :student_member do
    sequence(:student_number){|n|"0000000#{n}"}
    family_name{"山岡"}
    given_name{"凜"}
    family_name_kana{"ヤマオカ"}
    given_name_kana{"リン"}
    emergency_contact{"1234567890"}
    password{"pw"}
    grade{"2"}
    a_class{"3"}
    graduation_date{Date.tomorrow}
    start_date{Date.yesterday}
    suspended{false}
  end
end