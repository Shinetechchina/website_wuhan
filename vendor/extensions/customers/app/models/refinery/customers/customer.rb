module Refinery
  module Customers
    class Customer < Refinery::Core::BaseModel
      self.table_name = 'refinery_customers'

      attr_accessible :tag_list, :name, :image_id, :description, :position
      acts_as_indexed :fields => [:name, :description]

      validates_presence_of :name, :image, :description
      validates :name, :uniqueness => true

      acts_as_taggable

      belongs_to :image, :class_name => '::Refinery::Image'

      liquid_methods :name, :description

      include ImageExt
    end
  end
end
