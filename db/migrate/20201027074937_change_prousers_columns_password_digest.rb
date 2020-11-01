class ChangeProusersColumnsPasswordDigest < ActiveRecord::Migration[6.0]
  def change
    change_column :prousers, :password_digest, :string
  end
end
