module Refinery
  module Shinetech
    class Client < Refinery::Core::BaseModel

      attr_accessible :name, :description, :logo_id, :comment, :commenter, :position

      acts_as_indexed :fields => [:name, :description]

      validates :name, :presence => true, :uniqueness => true
      validates :logo, :description, presence: true

      belongs_to :logo, :class_name => '::Refinery::Image'
      has_many :boxes, as: :boxable, dependent: :destroy

      default_scope order(:position)
    end
  end
end
