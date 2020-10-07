FactoryBot.define do
  factory:student_member do
    sequence(:student_number){|n|"0000000#{n}"}
    password{"pw"}
    graduation_date{Date.tomorrow}
    start_date{Date.yesterday}
    suspended{false}
  end
end