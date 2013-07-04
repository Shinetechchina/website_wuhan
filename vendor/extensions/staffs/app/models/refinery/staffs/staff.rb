module Refinery
  module Staffs
    class Staff < Refinery::Core::BaseModel
      self.table_name = 'refinery_staffs'

      attr_accessible :name, :email, :number, :title, :image_id, :description, :position

      acts_as_indexed :fields => [:name, :email, :title, :description]

      validates_uniqueness_of :name, :number, :email
      validates_presence_of :name, :email, :image
      validates_numericality_of :number, greater_than: 0
      validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

      belongs_to :image, :class_name => '::Refinery::Image'

      liquid_methods :name, :email, :number, :title, :description

      include ImageExt

    end
  end
end
