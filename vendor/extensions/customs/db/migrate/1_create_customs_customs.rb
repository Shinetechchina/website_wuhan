class CreateCustomsCustoms < ActiveRecord::Migration

  def up
    create_table :refinery_customs do |t|
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
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-customs"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/customs/customs"})
    end

    drop_table :refinery_customs

  end

end
