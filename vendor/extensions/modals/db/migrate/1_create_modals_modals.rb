class CreateModalsModals < ActiveRecord::Migration

  def up
    create_table :refinery_modals do |t|
      t.string :title
      t.string :path
      t.text :content
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-modals"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/modals/modals"})
    end

    drop_table :refinery_modals

  end

end
