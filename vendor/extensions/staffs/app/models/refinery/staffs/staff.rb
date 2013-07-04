module Refinery
  module Staffs
    class Staff < Refinery::Core::BaseModel
      self.table_name = 'refinery_staffs'

      attr_accessible :name, :email, :number, :title, :image_id, :description, :position

      acts_as_indexed :fields => [:name, :email, :title, :description]

      validates_uniqueness_of :name, :number, :email
      validates_presence_of :name, :email, :image
      validates_numericality_of :number, greater_than: 0

      belongs_to :image, :class_name => '::Refinery::Image'

      liquid_methods :name, :email, :number, :title, :description, :image_url, :has_image?

      def has_image?
        !image.blank?
      end

      # return box size's image url
      def image_url
        self.image.try(:box_size_url)
      end
    end
  end
end
