class AddColumnsPost < ActiveRecord::Migration[6.0]
  def change

    add_column :posts, :user_id, :integer
    add_column :posts, :prouser_id, :integer
    add_column :posts, :content, :text
  
  end
end
