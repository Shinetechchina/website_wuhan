module Refinery
  module Staffs
    class StaffsController < ::ApplicationController
      def index
        @staffs = Staff.order('position ASC')
        @page = ::Refinery::Page.where(:link_url => "/staff").first
        render layout: false
      end
    end
  end
end
