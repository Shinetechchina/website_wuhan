class Blog

  attr_reader :name, :created_at, :image_url, :text, :profile_link

  def initialize(weibo)
    @name = weibo["user"]["name"]
    @created_at = weibo["user"]["created_at"].to_date
    @image_url = Blog.select_image_url(weibo)
    @text = weibo["text"]
    @profile_link =  "http://weibo.com/" + weibo["user"]["domain"]
  end

  def self.all
    if (weibo_list = ::Authentication.weibo_list).present?
      weibo_list.map do |weibo|
        [Blog.new(weibo)]
      end.inject(:+)
    else
      []
    end
  end

  def self.filter_topic(topic)
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
