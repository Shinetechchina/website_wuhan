class AddColumnsToRefineryUsers < ActiveRecord::Migration
  def up
    add_column :refinery_users, :nickname, :string
  end

  def down
    remove_column :refinery_users, :nickname
  end
end
