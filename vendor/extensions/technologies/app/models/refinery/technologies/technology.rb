module Refinery
  module Technologies
    class Technology < Refinery::Core::BaseModel
      self.table_name = 'refinery_technologies'

      attr_accessible :tag_list, :title, :image_id, :description, :position
      acts_as_indexed :fields => [:title]

      validates_presence_of :title, :image, :description
      validates :title, :uniqueness => true

      acts_as_taggable

      belongs_to :image, :class_name => '::Refinery::Image'
    end
  end
end
