module Refinery
  module Staffs
    class StaffsController < ::ApplicationController
      def index
        @staffs = Staff.order('position ASC')
        @staffs = @staffs.tagged_with(params[:tag], any: true) if params[:tag].present?
        @page = ::Refinery::Page.where(:link_url => "/staff").first
        render layout: false
      end
    end
  end
end
