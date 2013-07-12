module Refinery
  module Customers
    module Admin
      class CustomersController < ::Refinery::AdminController

        crudify :'refinery/customers/customer',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
