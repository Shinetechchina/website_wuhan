# This migration comes from refinery_technologies (originally 2)
class AddTagsToTechnologies < ActiveRecord::Migration
  def up
    add_column :refinery_technologies, :tags, :string, array: true, limit: 30
  end

  def down
    remove_column :refinery_technologies, :tags
  end
end
