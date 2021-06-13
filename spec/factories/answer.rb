FactoryBot.define do
  factory :answer do
    association :question
    association :teacher_member
    association :student_member
    body { "これはバームクーヘン積分で一発です。" }
  end
end