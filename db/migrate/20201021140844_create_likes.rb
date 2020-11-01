class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :prouser_id
      t.integer :post_id

      t.timestamps
    end
  end
end
