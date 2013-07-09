class Authentication < ActiveRecord::Base
  belongs_to :refinery_user
  attr_accessible :provider, :uid, :user_id

  validates :provider, :presence => true, :uniqueness => {:scope => :user_id}
  validates :uid, :presence => true, :uniqueness => {:scope => :provider}

  def self.find_or_create_from_auth_hash(auth_hash)
    self.find_or_create_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid].to_s)
  end
end
