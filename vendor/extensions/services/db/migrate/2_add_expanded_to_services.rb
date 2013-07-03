class AddExpandedToServices < ActiveRecord::Migration
  def up
    add_column :refinery_services, :expanded, :boolean, default: false
  end

  def down
    remove_column :refinery_services, :expanded
  end
end
