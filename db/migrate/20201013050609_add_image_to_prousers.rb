class AddImageToProusers < ActiveRecord::Migration[6.0]
  def change
    add_column :prousers, :image, :string
  end
end
