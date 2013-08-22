module Refinery
  module Customs
    module Admin
      class CustomsController < ::Refinery::AdminController

        crudify :'refinery/customs/custom', :xhr_paging => true

      end
    end
  end
end
