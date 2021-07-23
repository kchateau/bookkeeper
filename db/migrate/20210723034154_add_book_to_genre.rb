class AddBookToGenre < ActiveRecord::Migration[6.1]
  def change
    add_reference :genres, :book, index: true
  end
end
