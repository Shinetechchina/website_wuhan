class CreateIcons < ActiveRecord::Migration
  def change
    create_table :icons do |t|
      t.string :title
      t.integer :staff_id

      t.timestamps
    end
  end
end
