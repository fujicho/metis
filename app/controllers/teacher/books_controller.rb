class Teacher::BooksController < Teacher::Base
  def index
    @book_search_form = Teacher::BookSearchForm.new(search_params)
    @books = @book_search_form.search.page(params[:page])
  end

  def new
    @book_form = Teacher::BookForm.new
  end

  def create
    @book_form = Teacher::BookForm.new
    @book_form.assign_attributes(params[:form])
    if @book_form.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end



  private def search_params
    params[:search]&.permit([
      :book_name, :book_subject, :type,
      :book_year
    ])
  end
end