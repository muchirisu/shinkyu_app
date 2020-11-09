class AddColumnsProuser < ActiveRecord::Migration[6.0]
  def change
    add_column :prousers, :name, :string 
    add_column :prousers, :email, :string 
    add_column :prousers, :birthday, :date
    add_column :prousers, :image, :string 
    add_column :prousers, :password, :string 
    add_column :prousers, :prefecture, :string 
    add_column :prousers, :image_identification, :string 
    add_column :prousers, :access, :string 
    add_column :prousers, :content, :text
    add_column :prousers, :salon_homepage, :text
  end
end
