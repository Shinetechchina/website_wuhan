# This migration comes from refinery_custom_boxes (originally 1)
class CreateCustomBoxesCustomBoxes < ActiveRecord::Migration

  def up
    create_table :refinery_custom_boxes do |t|
      t.string :title
      t.integer :width
      t.integer :height
      t.text :content
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-custom_boxes"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/custom_boxes/custom_boxes"})
    end

    drop_table :refinery_custom_boxes

  end

end
