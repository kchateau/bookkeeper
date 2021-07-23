class RenameReadTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :reads, :user_reads
  end
end
