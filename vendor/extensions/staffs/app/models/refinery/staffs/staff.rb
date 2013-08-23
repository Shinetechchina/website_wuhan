module Refinery
  module Staffs
    class Staff < Refinery::Core::BaseModel
      self.table_name = 'refinery_staffs'

      attr_accessible :tags, :name, :email, :number, :title, :quote, :image_id, :second_image_id, :description, :position, :cv_url, :facebook_url, :github_url, :linkedin_url, :twitter_url, :weibo_url

      acts_as_indexed :fields => [:name, :email, :title, :description]

      validates_uniqueness_of :name, :number, :email
      validates_presence_of :name, :email, :image
      validates_numericality_of :number, greater_than: 0
      validates_length_of :description, maximum: 1000
      validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

      belongs_to :image, :class_name => '::Refinery::Image'
      belongs_to :second_image, :class_name => '::Refinery::Image'
      has_many :boxes, as: :boxable, dependent: :destroy

      liquid_methods :name, :number, :title, :description,
        :email?, :email, :github_url?, :github_url, :linkedin_url?, :linkedin_url, :twitter_url?, :twitter_url, :weibo_url?, :weibo_url

      include ImageExt
      include Taggable

    end
  end
end
