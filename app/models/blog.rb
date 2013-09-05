class Blog

  attr_reader :name, :created_at, :image_url, :text, :profile_link

  def initialize(provider)
    @name = provider["user"]["name"]
    @created_at = provider["user"]["created_at"].to_date
    @image_url = Blog.select_image_url(provider)
    @text = provider["text"]
    @profile_link =  "http://weibo.com/" + weibo["user"]["domain"]
  end

  def self.all
    ::Authentication.weibo_list
  end

  def self.filte_topic(topic)
    topic_regexp = Regexp.new("#" + topic + "#")
    blogs = self.all
    blogs.select do |blog|
      blog.text =~ topic_regexp
    end
  end

  def self.select_image_url(weibo)
    weibo["bmiddle_pic"] ||
    (weibo["retweeted_status"]["bmiddle_pic"] if weibo.has_key?("retweeted_status")) ||
    weibo["user"]["avatar_large"]
  end

end
