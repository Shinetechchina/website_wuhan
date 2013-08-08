module Refinery
  module Technologies
    class TechnologiesController < ::ApplicationController
      def index
        @technologies = Technology.scoped
        @technologies = @technologies.order_by_tag(tag) if has_tag?

        if request.xhr?
          render layout: false
        end
      end
    end
  end
end
