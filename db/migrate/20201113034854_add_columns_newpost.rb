class AddColumnsNewpost < ActiveRecord::Migration[6.0]
  def change
    add_column :newposts, :newuser_id, :integer
    add_column :newposts, :user_type, :integer
    add_column :newposts, :content, :text

  end
end
