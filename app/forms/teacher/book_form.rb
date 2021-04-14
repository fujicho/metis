class Teacher::BookForm
  include ActiveModel::Model

  attr_accessor :book
  delegate :persisted? , :save, to: :book

  def initialize(book = nil)
    @book = book
    @book ||= Book.new
  end

  def assign_attributes(params = {})
    @params = params
    # if @book.type == "past"
    #   @book = PastBook.new
    # else
    #   @book = WorkBook.new
    # end
    @book.assign_attributes(book_params)
  end

  
  def save
    book.save
  end

  private def book_params
    @params.permit(:book_name, :book_subject,
      :book_year, :type)
  end
end