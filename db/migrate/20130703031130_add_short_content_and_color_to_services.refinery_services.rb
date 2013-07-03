# This migration comes from refinery_services (originally 3)
class AddShortContentAndColorToServices < ActiveRecord::Migration
  def up
    add_column :refinery_services, :short_content, :string
    add_column :refinery_services, :color, :string, limit: 50
  end

  def down
    remove_column :refinery_services, :color
    remove_column :refinery_services, :short_content
  end
end
