class CreateNewusers < ActiveRecord::Migration[6.0]
  def change
    create_table :newusers do |t|

      t.timestamps
    end
  end
end
