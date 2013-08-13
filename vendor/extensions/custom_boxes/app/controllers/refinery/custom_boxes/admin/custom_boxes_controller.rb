module Refinery
  module CustomBoxes
    module Admin
      class CustomBoxesController < ::Refinery::AdminController

        crudify :'refinery/custom_boxes/custom_box', :xhr_paging => true

      end
    end
  end
end
