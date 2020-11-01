class ChangeProusersColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :prousers, :prefecture, :string
    add_column :prousers, :image_identification, :string
    add_column :prousers, :adress, :string
    add_column :prousers, :access, :string
    add_column :prousers, :content, :text
    add_column :prousers, :salon_homepage, :text

  end
end
