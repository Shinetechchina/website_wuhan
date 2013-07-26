module Refinery
  module Messages
    module Admin
      class MessagesController < ::Refinery::AdminController

        crudify :'refinery/messages/message',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
