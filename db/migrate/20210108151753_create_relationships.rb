class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :follower, null: false, foreign_key: { to_table: :newuers }
      t.references :following, null: false, foreign_key: { to_table: :newuers }

      t.timestamps
    end
    add_index :relationships, [:follower_id, :following_id], unique: true
  end
end
