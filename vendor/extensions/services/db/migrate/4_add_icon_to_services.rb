class AddIconToServices < ActiveRecord::Migration
  def up
    remove_column :image_id
    add_column :refinery_services, :icon, :string, limit: 30
  end

  def down
    remove_column :refinery_services, :icon
    add_column :image_id, :integer
  end
end
