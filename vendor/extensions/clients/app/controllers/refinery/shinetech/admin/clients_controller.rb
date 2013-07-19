module Refinery
  module Shinetech
    module Admin
      class ClientsController < ::Refinery::AdminController

        crudify :'refinery/shinetech/client',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
