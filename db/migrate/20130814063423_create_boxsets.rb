class CreateBoxsets < ActiveRecord::Migration
  def up
    create_table :boxsets do |t|
      t.string :url

      t.timestamps
    end
  end

  def down
    drop_table :boxsets
  end
end
