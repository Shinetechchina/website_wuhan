module Refinery
  module CustomBoxes
    class CustomBox < Refinery::Core::BaseModel
      self.table_name = 'refinery_custom_boxes'

      attr_accessible :title, :width, :height, :content, :position
      alias_attribute :name, :title

      acts_as_indexed :fields => [:title, :content]

      validates :title, :presence => true, :uniqueness => true
      validates_presence_of :width, :height, :content
    end
  end
end
