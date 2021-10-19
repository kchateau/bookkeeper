class BooksController < ApplicationController
  before_action :authenticate_user!
  def new
    @book = Book.new
  end

  def search
    @book = Book.new
  end

  def search_results
    @books = GoogleBooks.search(book_params['title'], {:count => 10})
  end

  def shelf
    binding.pry
  end

  def create
    #@book = Book.create(book_params)
    create_authors(params['authors'])
    @book = Book.find_or_create_by(
      title: params['title'],
      isbn: params['isbn'],
      image_link: params['image_link']
    )
    create_user_read(@book)
    redirect_to root_path
  end

  def destroy
    book = Book.find_by(id: params['id'])
    UserRead.find_by(user: current_user, book: book).destroy
    book.destroy
    current_user.reload
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :isbn, :genre_ids => [])
  end

  def create_user_read(book)
    UserRead.create(user: current_user, book: book, rating: 5)
  end

  def create_authors(names)
    Array(names).each do |name|
      Author.find_or_create_by(name: name)
    end
  end
end
