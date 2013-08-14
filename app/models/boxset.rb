class Boxset < ActiveRecord::Base
  attr_accessible :url
  validates_presence_of :url

  has_many :boxes
end
