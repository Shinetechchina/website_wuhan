module Refinery
  module Messages
    class Message < Refinery::Core::BaseModel
      belongs_to :staff, foreign_key: :staff_id, class_name: 'Refinery::Staffs::Staff'
      self.table_name = 'refinery_messages'

      attr_accessible :name, :email, :content, :position, :phone_number, :staff_id

      acts_as_indexed :fields => [:name, :email, :content]

      validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, allow_nil: true
      validates_presence_of :name, :email, :content, if: "staff_id.nil?"
      validates_presence_of :phone_number, if: Proc.new{|m| m.staff_id.present? and m.email.blank?}
      validates_presence_of :email, if: Proc.new{|m| m.staff_id.present? and m.phone_number.blank?}

      def comment?
        !self.staff_id?
      end
    end
  end
end
