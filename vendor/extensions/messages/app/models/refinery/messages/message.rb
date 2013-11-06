module Refinery
  module Messages
    class Message < Refinery::Core::BaseModel
      belongs_to :staff, foreign_key: :staff_id, class_name: 'Refinery::Staffs::Staff'
      self.table_name = 'refinery_messages'
      after_create :send_message_mail

      attr_accessible :name, :email, :content, :position, :phone_number, :staff_id, :company, :from_ip, :platform, :browser

      acts_as_indexed :fields => [:name, :email, :content]

      validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      validates_presence_of :name, :email, :company, :content

      def comment?
        !self.staff_id?
      end

      def send_message_mail
        Refinery::User.all.each do |user|
          ::MessageMailer.comment_message(self.id, user).deliver
        end
      end
    end
  end
end
