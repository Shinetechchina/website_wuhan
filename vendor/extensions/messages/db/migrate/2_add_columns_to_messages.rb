class AddColumnsToMessages < ActiveRecord::Migration
  def up
    add_column :refinery_messages, :staff_id, :integer
    add_column :refinery_messages, :phone_number, :string
  end

  def down
    remove_column :refinery_messages, :staff_id
    remove_column :refinery_messages, :phone_number
  end
end
