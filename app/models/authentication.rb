class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :access_token, :expires_in

  validates_presence_of :access_token, :uid, :provider
  validates :provider, :uniqueness => {:scope => :uid}
  validates :uid, :uniqueness => {:scope => :provider}

  scope :weibo, where(provider: 'weibo')
  scope :instagram, where(provider: 'instagram')

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid].to_s
    access_token = auth_hash["credentials"]["token"]
    if (expires_at = auth_hash["credentials"]["expires_at"]).present?
      expires_in = Time.at(expires_at)
    else
      expires_in = nil
    end

    authentication = self.find_by_provider_and_uid(provider, uid)

    if authentication.present?
      if authentication.expires_in?
        authentication.try(:update_expires_in, expires_in)
      end
    else
      self.create({
        provider: provider,
        uid: uid,
        access_token: access_token,
        expires_in: expires_in
      })
    end
  end

  def update_expires_in(time)
    if time > self.expires_in
      self.expires_in = time
      self.save!
    end
    return self
  end

  def self.instagram_list
    if self.instagram.present?
      self.instagram.map do |authentication|
        json_data = HTTParty.get("https://api.instagram.com/v1/users/#{authentication.uid}/media/recent",
                                  query: {access_token: authentication.access_token})
        json_data['data'].map do |i|
          i.merge({'provider' => 'instagram'})
        end
      end.inject(:+)
    else
      []
    end
  end

  def self.weibo_list
    if self.weibo.present?
      self.weibo.map do |authentication|
        json_data = HTTParty.get("https://api.weibo.com/2/statuses/user_timeline.json",
                                 query: {access_token: authentication.access_token, uid: authentication.uid})
        json_data["statuses"].map do |w|
          w.merge({'provider' => 'weibo'})
        end
      end.inject(:+)
    else
      []
    end
  end

  def weibo?
    self.provider == 'weibo'
  end

end
