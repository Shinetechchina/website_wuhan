class AddSignatureToStaffs < ActiveRecord::Migration
  def up
    add_column :refinery_staffs, :signature, :string
  end

  def down
    remove_column :refinery_staffs, :signature
  end
end
