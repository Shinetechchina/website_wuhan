module Refinery
  module Staffs
    class StaffsController < ::ApplicationController
      def index
        @staffs = Staff.scoped
        @staffs = @staffs.tagged_with(tag, any: true) if has_tag?

        if request.xhr?
          render layout: false
        end
      end
    end
  end
end
