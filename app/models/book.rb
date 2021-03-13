class Book < ApplicationRecord
  require "date"
  this_year = Date.today.year
  BOOK_YEAR = (1950..this_year).to_a
end
