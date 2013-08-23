# This migration comes from refinery_staffs (originally 4)
class AddColumnsToStaffs < ActiveRecord::Migration
  def up
    add_column :refinery_staffs, :second_image_id, :integer
    add_column :refinery_staffs, :facebook_url, :string
    add_column :refinery_staffs, :cv_url, :string
    add_column :refinery_staffs, :quote, :integer
  end

  def down
    remove_column :refinery_staffs, :second_image_id
    remove_column :refinery_staffs, :facebook_url
    remove_column :refinery_staffs, :cv_url
    remove_column :refinery_staffs, :quote
  end
end
