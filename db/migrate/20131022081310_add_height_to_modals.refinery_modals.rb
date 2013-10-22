# This migration comes from refinery_modals (originally 4)
class AddHeightToModals < ActiveRecord::Migration
  def up
    add_column :refinery_modals, :height, :integer
  end

  def down
    remove_column :refinery_modals, :height
  end
end
