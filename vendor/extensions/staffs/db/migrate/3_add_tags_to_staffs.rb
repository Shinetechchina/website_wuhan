class AddTagsToStaffs < ActiveRecord::Migration
  def up
    add_column :refinery_staffs, :tags, :string, array: true, limit: 50
  end

  def down
    remove_column :refinery_staffs, :tags
  end
end
