class AddLimitToBookDescriptionText < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :description, :text, :limit => 100
  end
end
