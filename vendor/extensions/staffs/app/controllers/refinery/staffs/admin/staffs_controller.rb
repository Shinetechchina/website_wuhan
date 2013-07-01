module Refinery
  module Staffs
    module Admin
      class StaffsController < ::Refinery::AdminController

        crudify :'refinery/staffs/staff',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
