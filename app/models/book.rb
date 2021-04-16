class Book < ApplicationRecord
  require "date"
  this_year = Date.today.year
  years = (1950..this_year).to_a
  BOOK_YEAR = years << "不明"


  validates :book_name, :book_subject, presence: true

  SUBJECT_NAMES = %w(
    英語 数学 物理 化学 現代文 古典 世界史 日本史 地理
  )
end
