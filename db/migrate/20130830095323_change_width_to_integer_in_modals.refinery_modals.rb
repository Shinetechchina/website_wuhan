# This migration comes from refinery_modals (originally 3)
class ChangeWidthToIntegerInModals < ActiveRecord::Migration
  def up
    remove_column :refinery_modals, :width
    add_column :refinery_modals, :width, :integer
  end

  def down
    remove_column :refinery_modals, :width
    add_column :refinery_modals, :width, :string
  end
end
