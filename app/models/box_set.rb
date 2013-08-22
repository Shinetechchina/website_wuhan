class BoxSet < ActiveRecord::Base
  attr_accessible :url
  validates_presence_of :url
  validates_uniqueness_of :url

  has_many :boxes, order: 'position', dependent: :destroy

  before_save :improve_url

  def improve_url
    url = self.url
    if url.present? and url.first != '/'
      self.url = '/' + url
    end
  end
end
