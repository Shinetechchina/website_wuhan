# This migration comes from refinery_messages (originally 3)
class AddCompanyToMessages < ActiveRecord::Migration
  def up
    add_column :refinery_messages, :company, :string
  end

  def down
    remove_column :refinery_messages, :company
  end
end
