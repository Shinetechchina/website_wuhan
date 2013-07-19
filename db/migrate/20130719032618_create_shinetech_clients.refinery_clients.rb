# This migration comes from refinery_clients (originally 1)
class CreateShinetechClients < ActiveRecord::Migration

  def up
    create_table :refinery_shinetech_clients do |t|
      t.string  :name
      t.text    :description
      t.integer :logo_id
      t.text    :comment
      t.string  :commenter
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-shinetech"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/shinetech/clients"})
    end

    drop_table :refinery_shinetech_clients

  end

end
