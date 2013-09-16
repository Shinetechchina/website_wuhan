module Refinery
  module Customs
    class Custom < Refinery::Core::BaseModel
      self.table_name = 'refinery_customs'
      has_many :boxes, as: :boxable, dependent: :destroy

      attr_accessible :title, :width, :height, :content, :position
      alias_attribute :name, :title

      acts_as_indexed :fields => [:title, :content]

      validates_presence_of :title, :width, :height, :content
      validates_uniqueness_of :title

      def real_height
        height = self.height
        (height * 288 + (height-1) * 20).to_s + 'px'
      end

      def real_width
        width = self.width
        (width * 280 + (width-1) * 20).to_s + 'px'
      end
    end
  end
end
