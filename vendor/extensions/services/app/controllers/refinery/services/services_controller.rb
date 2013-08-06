module Refinery
  module Services
    class ServicesController < ::ApplicationController
      def index
        @services = Service.all

        if request.xhr?
          render layout: false
        end
      end
    end
  end
end
