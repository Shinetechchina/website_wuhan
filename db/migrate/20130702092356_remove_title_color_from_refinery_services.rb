class RemoveTitleColorFromRefineryServices < ActiveRecord::Migration
  def up
    remove_column :refinery_services, :color
  end

  def down
    add_column :refinery_services, :color, :string
  end
end
