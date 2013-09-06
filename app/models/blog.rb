class Blog
  attr_accessor :name, :created_at, :image_url, :text, :profile_link

  def initialize(json_data)
    if json_data['provider'] == 'weibo'
      self.weibo_init(json_data)
    elsif json_data['provider'] == 'instagram'
      self.instagram_init(json_data)
    end
  end

  def weibo_init(json_data)
    self.name = json_data["user"]["name"]
    self.created_at = json_data["user"]["created_at"].to_date
    self.image_url = Blog.weibo_select_image_url(json_data)
    self.text = json_data["text"]
    self.profile_link =  "http://weibo.com/" + json_data["user"]["domain"]
  end

  def instagram_init(json_data)
    self.name = json_data['caption']['from']['username']
    self.created_at = Time.at(json_data["created_time"].to_i).to_date
    self.image_url = json_data['images']['low_resolution']['url']
    self.text = json_data['caption']["text"]
    self.profile_link =  "http://instagram.com/" + self.name
  end

  def self.all
    json_list = ::Authentication.weibo_list + ::Authentication.instagram_list
    if json_list.present?
      json_list.map do |json_data|
        [self.new(json_data)]
      end.inject(:+)
    else
      []
    end
  end

  def self.filte_topic(topic)
    topic_regexp = Regexp.new("#" + topic + "#")
    blogs = self.all
    blogs.select do |blog|
      blog.text =~ topic_regexp
    end
  end

  def self.weibo_select_image_url(weibo)
    weibo["bmiddle_pic"] ||
    (weibo["retweeted_status"]["bmiddle_pic"] if weibo.has_key?("retweeted_status")) ||
    weibo["user"]["avatar_large"]
  end

end
