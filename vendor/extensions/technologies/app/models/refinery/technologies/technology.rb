module Refinery
  module Technologies
    class Technology < Refinery::Core::BaseModel
      self.table_name = 'refinery_technologies'

      attr_accessible :tags, :title, :image_id, :description, :position
      acts_as_indexed :fields => [:title]

      validates_presence_of :title, :image, :description
      validates :title, :uniqueness => true

      belongs_to :image, :class_name => '::Refinery::Image'

      liquid_methods :title, :description

      include ImageExt
      include Taggable

      def image_url
        image.thumbnail("230x100>").url
      end
    end
  end
end
