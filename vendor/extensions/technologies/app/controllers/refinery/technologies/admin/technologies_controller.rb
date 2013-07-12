module Refinery
  module Technologies
    module Admin
      class TechnologiesController < ::Refinery::AdminController

        crudify :'refinery/technologies/technology', :xhr_paging => true

      end
    end
  end
end
