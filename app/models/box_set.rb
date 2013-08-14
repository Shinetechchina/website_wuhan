class BoxSet < ActiveRecord::Base
  attr_accessible :url
  validates_presence_of :url

  has_many :boxes, order: 'position'
end
