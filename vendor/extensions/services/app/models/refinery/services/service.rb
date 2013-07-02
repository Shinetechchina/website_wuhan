module Refinery
  module Services
    class Service < Refinery::Core::BaseModel
      self.table_name = 'refinery_services'

      attr_accessible :title, :color, :image_id, :content, :position

      acts_as_indexed :fields => [:title, :color, :content]

      validates_presence_of :title, :color, :image, :content
      validates_uniqueness_of :title

      belongs_to :image, :class_name => '::Refinery::Image'

      liquid_methods :title, :color, :content
    end
  end
end
