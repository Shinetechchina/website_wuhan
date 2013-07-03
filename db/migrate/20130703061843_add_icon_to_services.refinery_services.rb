# This migration comes from refinery_services (originally 4)
class AddIconToServices < ActiveRecord::Migration
  def up
    add_column :refinery_services, :icon, :string, limit: 30
  end

  def down
    remove_column :refinery_services, :icon
  end
end
