class AddOtherSocialLinksToStaffs < ActiveRecord::Migration
  def up
    add_column :refinery_staffs, :ruby,   :string
    add_column :refinery_staffs, :rails, :string
    add_column :refinery_staffs, :dot_net,  :string
    add_column :refinery_staffs, :javascript,  :string
    add_column :refinery_staffs, :cpp,  :string
  end

  def down
    remove_column :refinery_staffs, :google_plus_url
    remove_column :refinery_staffs, :qq_weibo_url
    remove_column :refinery_staffs, :instagram_url
  end
end
