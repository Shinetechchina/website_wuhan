# This migration comes from refinery_messages (originally 1)
class CreateMessagesMessages < ActiveRecord::Migration

  def up
    create_table :refinery_messages do |t|
      t.string :name
      t.string :email
      t.text :content
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-messages"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/messages/messages"})
    end

    drop_table :refinery_messages

  end

end
