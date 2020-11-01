class ChangeProuserColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :prousers, :password_digest, :integer
    remove_column :prousers, :password, :integer
  end
end
