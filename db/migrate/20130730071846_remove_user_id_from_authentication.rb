class RemoveUserIdFromAuthentication < ActiveRecord::Migration
  def up
    remove_column :authentications, :user_id
  end

  def down
    add_column :authentications, :user_id, type: :string
  end
end
