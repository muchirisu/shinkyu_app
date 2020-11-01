class AddProuserIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :prouser_id, :integer
  end
end
