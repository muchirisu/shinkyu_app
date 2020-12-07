class CreateNewlikes < ActiveRecord::Migration[6.0]
  def change
    create_table :newlikes do |t|

      t.timestamps
    end
  end
end
