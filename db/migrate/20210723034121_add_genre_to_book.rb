class AddGenreToBook < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :genre, index: true
  end
end
