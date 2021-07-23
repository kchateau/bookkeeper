class BooksController < ApplicationController
  before_action :authenticate_user!
  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    create_user_read(@book)
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :isbn, :genre_ids => [])
  end

  def create_user_read(book)
    UserRead.create(user: current_user, book: book, rating: 5)
  end
end
