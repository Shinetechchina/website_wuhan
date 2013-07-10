class AddColumnsToAuthentications < ActiveRecord::Migration
  def up
    add_column :authentications, :access_token, :string
    add_column :authentications, :expires_in,   :datetime
  end

  def down
    remove_column :authentications, :access_token
    remove_column :authentications, :expires_in
  end
end
