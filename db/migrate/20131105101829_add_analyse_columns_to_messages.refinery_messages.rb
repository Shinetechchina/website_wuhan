# This migration comes from refinery_messages (originally 4)
class AddAnalyseColumnsToMessages < ActiveRecord::Migration
  def up
    add_column :refinery_messages, :from_ip, :string
    add_column :refinery_messages, :browser, :string
    add_column :refinery_messages, :platform, :string
  end

  def down
    remove_column :refinery_messages, :from_ip
    remove_column :refinery_messages, :browser
    remove_column :refinery_messages, :platform
  end
end
