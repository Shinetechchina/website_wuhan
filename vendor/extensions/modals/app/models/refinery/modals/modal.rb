module Refinery
  module Modals
    class Modal < Refinery::Core::BaseModel
      self.table_name = 'refinery_modals'

      attr_accessible :title, :path, :content, :position

      acts_as_indexed :fields => [:title, :path, :content]

      validates_presence_of :title, :path, :content
      validates_uniqueness_of :title, :path
      validates_exclusion_of :path, in: '#back'
      validates_format_of :path, with: /^#/
    end
  end
end
