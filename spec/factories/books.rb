FactoryBot.define do
  factory :book do
    sequence(:book_name) { |n| "参考書その#{n}"}
    book_subject { "数学" }
    book_year { "2015" }
    book_type { "work" }
  end
end