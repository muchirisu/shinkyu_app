class CreateProusers < ActiveRecord::Migration[6.0]
  def change
    create_table :prousers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.date :birthday

      t.timestamps
    end
  end
end
