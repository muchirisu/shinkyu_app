class ChangeColumnsComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :user_id, :integer
    add_column :comments, :prouser_id, :integer
    add_column :comments, :post_id, :integer
    add_column :comments, :comment_content, :text
  end
end
