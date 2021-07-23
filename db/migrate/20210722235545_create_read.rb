class CreateRead < ActiveRecord::Migration[6.1]
  def change
    create_table :reads do |t|
      t.references :user, index: true
      t.references :book, index: true
      t.integer :rating
      t.timestamps
    end
  end
end
