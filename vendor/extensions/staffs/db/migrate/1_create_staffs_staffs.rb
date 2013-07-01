class CreateStaffsStaffs < ActiveRecord::Migration

  def up
    create_table :refinery_staffs do |t|
      t.string :name
      t.string :email
      t.integer :number
      t.string :title
      t.integer :image_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-staffs"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/staffs/staffs"})
    end

    drop_table :refinery_staffs

  end

end
