class AddHeightToTechnologies < ActiveRecord::Migration
  def up
    add_column :refinery_technologies, :height, :integer
  end

  def down
    remove_column :refinery_technologies, :height
  end
end
