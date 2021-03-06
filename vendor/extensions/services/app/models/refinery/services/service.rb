module Refinery
  module Services
    class Service < Refinery::Core::BaseModel
      self.table_name = 'refinery_services'

      attr_accessible :title, :color, :icon, :expanded, :short_content, :content, :position
      alias_attribute :name, :title

      has_many :boxes, as: :boxable, dependent: :destroy
      acts_as_indexed :fields => [:title, :short_content, :content]

      validates_presence_of :title, :color, :icon, :short_content, :content
      validates_inclusion_of :expanded, in: [true, false]
      validates_uniqueness_of :title
      validates_length_of :color, maximum: 50
      validates_length_of :icon, maximum: 30

      default_scope order(:position)

      liquid_methods :title, :color, :icon, :expanded, :short_content, :content
    end
  end
end
