class AddOtherSocialLinksToStaffs < ActiveRecord::Migration
  def up
    add_column :refinery_staffs, :google_plus_url,   :string
    add_column :refinery_staffs, :qq_weibo_url, :string
    add_column :refinery_staffs, :instagram_url,  :string
  end

  def down
    remove_column :refinery_staffs, :google_plus_url
    remove_column :refinery_staffs, :qq_weibo_url
    remove_column :refinery_staffs, :instagram_url
  end
end
