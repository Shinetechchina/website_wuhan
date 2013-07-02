class CreateServicesServices < ActiveRecord::Migration

  def up
    create_table :refinery_services do |t|
      t.string :title
      t.string :color
      t.integer :image_id
      t.text :content
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-services"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/services/services"})
    end

    drop_table :refinery_services

  end

end
