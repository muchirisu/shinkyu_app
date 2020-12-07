class ChangeColumnsNewuser < ActiveRecord::Migration[6.0]
  def change
    add_column :newusers, :user_type, :integer
    add_column :newusers, :password_digest, :string
    remove_column :newusers, :password, :string
  end
end
