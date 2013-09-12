module Refinery
  module Staffs
    class StaffsController < ::ApplicationController
      def index
        @staffs = Staff.scoped
        @staffs = @staffs.order_by_tag(tag) if has_tag?

        if request.xhr?
          render layout: false
        end
      end

      def details
        @staff = Staff.find(params[:id])
        @box_id = params[:box_id]
        respond_to do |format|
          format.js
        end
      end
    end
  end
end
