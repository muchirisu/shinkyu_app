class ChangeColumnsProuser < ActiveRecord::Migration[6.0]
  def change
    add_column :prousers, :password_digest, :string
    remove_column :prousers, :password, :string
  end
end
