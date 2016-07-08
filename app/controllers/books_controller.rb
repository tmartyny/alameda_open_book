class BooksController < ApplicationController
  def index
    @books = current_user.books
  end

  def search
    if params[:query]
      @search_results = search_results(params[:query])
      unless @search_results
        flash[:notice] = "Unfortunately we can't reach the library at this time. Please try again later."
      end
      render "index"
    else
      redirect_to books_path, notice: "Please Provide a Valid Search Term"
    end
  end

  private

  def search_results(params)
    BookFinderService.new(params).library_search_results
  end
end