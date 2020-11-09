class AddColumnProuser < ActiveRecord::Migration[6.0]
  def change
    add_column :prousers, :address, :string
  end
end
