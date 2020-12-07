class AddColumnNewcomment < ActiveRecord::Migration[6.0]
  def change
    add_column :newcomments, :comment_content, :text
  end
end
