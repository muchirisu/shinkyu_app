class AddProuserColumnContent < ActiveRecord::Migration[6.0]
  def change
    change_column :prousers, :content, :text , default: ''
  end
end
