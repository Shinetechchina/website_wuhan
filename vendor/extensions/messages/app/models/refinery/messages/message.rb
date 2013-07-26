module Refinery
  module Messages
    class Message < Refinery::Core::BaseModel
      self.table_name = 'refinery_messages'

      attr_accessible :name, :email, :content, :position

      acts_as_indexed :fields => [:name, :email, :content]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
