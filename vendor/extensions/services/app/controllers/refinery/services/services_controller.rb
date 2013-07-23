module Refinery
  module Services
    class ServicesController < ::ApplicationController
      def index
        @services = Service.all
        @page = ::Refinery::Page.where(:link_url => "/services").first

        if request.xhr?
          render layout: false
        end
      end
    end
  end
end
