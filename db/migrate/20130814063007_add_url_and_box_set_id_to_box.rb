class AddUrlAndBoxSetIdToBox < ActiveRecord::Migration
  def up
    add_column :boxes, :url, :string
    add_column :boxes, :box_set_id, :integer
  end

  def down
    remove_column :boxes, :url
    remove_column :boxes, :box_set_id
  end
end
