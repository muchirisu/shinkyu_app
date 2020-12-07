class CreateNewcomments < ActiveRecord::Migration[6.0]
  def change
    create_table :newcomments do |t|

      t.timestamps
    end
  end
end
