class BoxSet < ActiveRecord::Base
  attr_accessible :url
  validates_presence_of :url
  validates_uniqueness_of :url

  has_many :boxes, order: 'position', dependent: :destroy

  before_save :set_url

  def set_url
    url = self.url
    if url.first != '/'
      self.url = '/' + url
    end
  end
end
