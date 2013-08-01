module Refinery
  module Messages
    class Message < Refinery::Core::BaseModel
      self.table_name = 'refinery_messages'

      attr_accessible :name, :email, :content, :position

      acts_as_indexed :fields => [:name, :email, :content]

      validates :name, :email, :content, :presence => true
      validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    end
  end
end
