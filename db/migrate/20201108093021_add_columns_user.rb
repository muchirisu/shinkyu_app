class AddColumnsUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string 
    add_column :users, :email, :string 
    add_column :users, :birthday, :date
    add_column :users, :image, :string 
    add_column :users, :password, :string 
    add_column :users, :prefecture, :string 
  end
end
