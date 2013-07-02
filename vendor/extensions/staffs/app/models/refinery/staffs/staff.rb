module Refinery
  module Staffs
    class Staff < Refinery::Core::BaseModel
      self.table_name = 'refinery_staffs'

      attr_accessible :name, :email, :number, :title, :image_id, :description, :position

      acts_as_indexed :fields => [:name, :email, :title, :description]

      validates_uniqueness_of :name, :number, :email
      validates_presence_of :name, :email, :image

      belongs_to :image, :class_name => '::Refinery::Image'

      liquid_methods :name, :email, :number, :title, :description
    end
  end
end
