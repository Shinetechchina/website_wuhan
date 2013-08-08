# This migration comes from refinery_staffs (originally 3)
class AddTagsToStaffs < ActiveRecord::Migration
  def up
    add_column :refinery_staffs, :tags, :string, array: true, limit: 50
  end

  def down
    remove_column :refinery_staffs, :tags, :string, array: true
  end
end
