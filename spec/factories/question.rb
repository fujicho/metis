FactoryBot.define do
  factory :question do
    association :student_member
    association :book
    title { "3章の2題目がわかりません。" }
    body { "ここらへんがわからないんです。" }
    subject { "数学" }
    closed {false}
  end
end