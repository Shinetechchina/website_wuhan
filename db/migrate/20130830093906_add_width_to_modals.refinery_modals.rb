# This migration comes from refinery_modals (originally 2)
class AddWidthToModals < ActiveRecord::Migration
  def up
    add_column :refinery_modals, :width, :string
  end

  def down
    remove_column :refinery_modals, :width
  end
end
