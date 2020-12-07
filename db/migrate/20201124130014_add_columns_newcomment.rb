class AddColumnsNewcomment < ActiveRecord::Migration[6.0]
  def change
    add_column :newcomments, :user_id, :integer
    add_column :newcomments, :post_id, :integer
  end
end
