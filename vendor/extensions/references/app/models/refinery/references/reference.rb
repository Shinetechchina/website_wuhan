module Refinery
  module References
    class Reference < Refinery::Core::BaseModel
      self.table_name = 'refinery_references'

      attr_accessible :title, :image_id, :content, :position

      acts_as_indexed :fields => [:title, :content]

      validates :title, :presence => true, :uniqueness => true
      validates_presence_of :image, :content

      belongs_to :image, :class_name => '::Refinery::Image'
    end
  end
end
