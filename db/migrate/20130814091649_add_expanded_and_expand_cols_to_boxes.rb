class AddExpandedAndExpandColsToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :expanded, :boolean, default: false
    add_column :boxes, :expand_cols, :integer
  end
end
