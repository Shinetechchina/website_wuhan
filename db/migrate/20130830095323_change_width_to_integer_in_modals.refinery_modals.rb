# This migration comes from refinery_modals (originally 3)
class ChangeWidthToIntegerInModals < ActiveRecord::Migration
  def up
    change_column :refinery_modals, :width, :integer
  end

  def down
    change_column :refinery_modals, :width, :string
  end
end
