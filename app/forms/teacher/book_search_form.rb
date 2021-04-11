class Teacher::BookSearchForm
  include ActiveModel::Model
  
  attr_accessor :book_name, :book_subject, :book_year, :type
  
  def rel_where 
    if book_name.present?
      rel = rel.where('book_name LIKE ?', "%#{book_name}%")
    end
    
    if book_subject.present?
      rel = rel.where(book_subject: book_subject)
    end
    
    if book_year.present?
      rel = rel.where(book_year: book_year)
    end
  end

  def search
    rel = Book

    if type.present?
      case type
      when "work"
        rel = WorkBook
        rel_where
      when "past"
        rel = PastBook
        rel_where
      else
        rel.order(:book_name, :book_year)
      end
    end
    rel.order(:book_name, :book_year)
  end
end