class DropTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :prousers
    drop_table :users
    drop_table :comments
    drop_table :likes
    drop_table :posts
  end
end
