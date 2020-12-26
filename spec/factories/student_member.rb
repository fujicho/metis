FactoryBot.define do
  factory :student_member do
    sequence(:student_number) {|n|"0000000#{n}"}
    sequence(:email) {|n|"member#{n}@example.com"}
    family_name {"山岡"}
    given_name {"凜"}
    family_name_kana {"ヤマオカ"}
    given_name_kana {"リン"}
    gender {"female" }
    emergency_contact {"1234567890"}
    telephone_number {"1234567890"}
    password {"pw"}
    birth_day {Date.new(2003, 7, 1)}
    grade {"2"}
    a_class {"3"}
    homeroom_teacher {"藤田"}
    graduation_date {Date.tomorrow}
    start_date {Date.yesterday}
    suspended {false}
    association :home_address, strategy: :build
    association :parents_address, strategy: :build
  end
end