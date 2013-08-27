# This migration comes from refinery_staffs (originally 5)
class AddSignatureToStaffs < ActiveRecord::Migration
  def up
    add_column :refinery_staffs, :signature, :string
  end

  def down
    remove_column :refinery_staffs, :signature
  end
end
