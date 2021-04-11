class Teacher::BooksController < Teacher::Base
  def index
    @book_search_form = Teacher::BookSearchForm.new(search_params)
    @books = @book_search_form.search.page(params[:page])
  end

  private def search_params
    params[:search]&.permit([
      :book_name, :book_subject, :type,
      :book_year
    ])
  end
end