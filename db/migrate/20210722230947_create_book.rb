class CreateBook < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.references :author, index: true
      t.string :title
      t.text :description
      t.string :isbn
      t.timestamps
    end
  end
end
