class AddColumnsNewuser < ActiveRecord::Migration[6.0]
  def change
    add_column :newusers, :user_id, :integer
    add_column :newusers, :name, :string
    add_column :newusers, :email, :string
    add_column :newusers, :birthday, :date
    add_column :newusers, :image, :string
    add_column :newusers, :image_identification, :string
    add_column :newusers, :prefecture, :string
    add_column :newusers, :address, :string
    add_column :newusers, :access, :string
    add_column :newusers, :post_id, :string
    add_column :newusers, :content, :string
    add_column :newusers, :salon_homepage, :string
    add_column :newusers, :password, :string
    
  end
end
