class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :access_token, :expires_in

  validates_presence_of :access_token, :uid, :provider, :expires_in
  validates :provider, :uniqueness => {:scope => :uid}
  validates :uid, :uniqueness => {:scope => :provider}

  scope :weibo, where(provider: 'weibo')

  def auth_params
    {uid: self.uid, access_token: self.access_token }
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid].to_s
    access_token = auth_hash["credentials"]["token"]
    expires_in = Time.at(auth_hash["credentials"]["expires_at"])

    self.find_by_provider_and_uid(provider, uid).try(:update_expires_in, expires_in) ||
    self.create({
      provider: provider,
      uid: uid,
      access_token: access_token,
      expires_in: expires_in
    })
  end

  def update_expires_in(time)
    if time > self.expires_in
      self.expires_in = time
      self.save!
    end
    return self
  end

  def weibo_timeline
    weibo_data('/statuses/user_timeline', {count: 20})["statuses"]
  end

  def self.weibo_list
    if (weibo_timeline = self.all.map(&:weibo_timeline).inject(:+)).present?
      weibo_timeline.sort_by{|weibo| weibo["id"]}.reverse
    else
      []
    end
  end

  def weibo_data(interface, options={})
    if self.weibo?
      HTTParty.get("https://api.weibo.com/2#{interface}.json", query: self.auth_params.merge(options))
    else
      false
    end
  end

  def weibo?
    self.provider == 'weibo'
  end

end
