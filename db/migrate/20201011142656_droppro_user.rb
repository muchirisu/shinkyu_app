class DropproUser < ActiveRecord::Migration[6.0]
  def change
    drop_table :pro_users
  end
end
