module Refinery
  module Technologies
    class Technology < Refinery::Core::BaseModel
      self.table_name = 'refinery_technologies'

      attr_accessible :tags, :title, :image_id, :description, :position, :height
      alias_attribute :name, :title

      acts_as_indexed :fields => [:title]

      validates_presence_of :title, :image, :description
      validates :title, :uniqueness => true

      belongs_to :image, :class_name => '::Refinery::Image'
      has_many :boxes, as: :boxable, dependent: :destroy

      liquid_methods :title, :description

      include ImageExt
      include Taggable

      def image_url
        image.thumbnail("230x100>").url
      end

      def real_height
        if self.height.nil? or self.height < 288
          288
        else
          self.height
        end
      end
    end
  end
end
