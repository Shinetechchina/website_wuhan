module Refinery
  module Staffs
    class StaffsController < ::ApplicationController
      def index
        @staffs = Staff.order('position ASC')
        @staffs = @staffs.tagged_with(tag, any: true) if tag != 'all'
        @page = ::Refinery::Page.where(link_url: "/staff").first
      end
    end
  end
end
