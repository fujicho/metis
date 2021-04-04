class Teacher::BookSearchForm
  include ActiveModel::Model

  attr_accessor :book_name, :book_subject, :book_year,
    :faculty_name, :type
end