module Refinery
  module Services
    module Admin
      class ServicesController < ::Refinery::AdminController

        crudify :'refinery/services/service', :xhr_paging => true

      end
    end
  end
end
