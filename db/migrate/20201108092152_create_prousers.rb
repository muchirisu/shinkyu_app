class CreateProusers < ActiveRecord::Migration[6.0]
  def change
    create_table :prousers do |t|

      t.timestamps
    end
  end
end
