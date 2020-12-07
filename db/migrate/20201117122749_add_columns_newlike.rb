class AddColumnsNewlike < ActiveRecord::Migration[6.0]
  def change
    add_column :newlikes, :user_id, :integer
    add_column :newlikes, :post_id, :integer
  end
end
