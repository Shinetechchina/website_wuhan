# This migration comes from refinery_technologies (originally 1)
class CreateTechnologiesTechnologies < ActiveRecord::Migration

  def up
    create_table :refinery_technologies do |t|
      t.string :title
      t.integer :image_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-technologies"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/technologies/technologies"})
    end

    drop_table :refinery_technologies

  end

end
