class Teacher::BookSearchForm
  include ActiveModel::Model
  
  attr_accessor :book_name, :book_subject, :book_year, :book_type

  def search

    rel = Book

    if book_type.present?
      rel = rel.where(book_type: book_type)
    end

    if book_name.present?
      rel = rel.where('book_name LIKE ?', "%#{book_name}%")
    end
    
    if book_subject.present?
      rel = rel.where(book_subject: book_subject)
    end
    
    if book_year.present?
      rel = rel.where(book_year: book_year)
    end

    rel.order(:book_name, :book_year)
  end
end