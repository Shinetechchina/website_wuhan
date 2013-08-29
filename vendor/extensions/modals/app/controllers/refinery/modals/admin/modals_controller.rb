module Refinery
  module Modals
    module Admin
      class ModalsController < ::Refinery::AdminController

        crudify :'refinery/modals/modal', :xhr_paging => true

      end
    end
  end
end
