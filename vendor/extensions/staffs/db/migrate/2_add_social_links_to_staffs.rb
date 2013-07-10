class AddSocialLinksToStaffs < ActiveRecord::Migration
  def up
    add_column :refinery_staffs, :github_url,   :string
    add_column :refinery_staffs, :linkedin_url, :string
    add_column :refinery_staffs, :twitter_url,  :string
    add_column :refinery_staffs, :weibo_url,    :string
  end

  def down
    remove_column :refinery_staffs, :github_url
    remove_column :refinery_staffs, :linkedin_url
    remove_column :refinery_staffs, :twitter_url
    remove_column :refinery_staffs, :weibo_url
  end
end
