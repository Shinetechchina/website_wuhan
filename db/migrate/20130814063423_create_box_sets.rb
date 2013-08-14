class CreateBoxSets < ActiveRecord::Migration
  def up
    create_table :box_sets do |t|
      t.string :url

      t.timestamps
    end
  end

  def down
    drop_table :box_sets
  end
end
