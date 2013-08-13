class RemoveTagIdFromBoxes < ActiveRecord::Migration
  def up
    remove_column :boxes, :tag_id
  end

  def down
    add_column :boxes, :tag_id, :integer
  end
end
