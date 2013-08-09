class CreateBoxes < ActiveRecord::Migration
  def up
    create_table :boxes do |t|
      t.integer :position
      t.integer :boxable_id
      t.string :boxable_type
      t.string :template
      t.integer :tag_id

      t.timestamps
    end
  end

  def down
    drop_table :boxes
  end
end
