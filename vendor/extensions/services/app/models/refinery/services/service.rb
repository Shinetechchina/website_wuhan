module Refinery
  module Services
    class Service < Refinery::Core::BaseModel
      self.table_name = 'refinery_services'

      attr_accessible :title, :expanded, :image_id, :content, :position

      acts_as_indexed :fields => [:title, :expanded, :content]

      validates_presence_of :title, :image, :content
      validates_inclusion_of :expanded, in: [true, false]
      validates_uniqueness_of :title

      belongs_to :image, :class_name => '::Refinery::Image'

      liquid_methods :title, :color, :content
    end
  end
end
