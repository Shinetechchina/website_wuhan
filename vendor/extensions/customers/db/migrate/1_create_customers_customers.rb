class CreateCustomersCustomers < ActiveRecord::Migration

  def up
    create_table :refinery_customers do |t|
      t.string :name
      t.integer :image_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-customers"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/customers/customers"})
    end

    drop_table :refinery_customers

  end

end
