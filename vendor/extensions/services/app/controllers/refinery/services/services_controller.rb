module Refinery
  module Services
    class ServicesController < ::ApplicationController
      def index
        @services = Service.order('position ASC')
        @page = ::Refinery::Page.where(:link_url => "/services").first
        render layout: false
      end
    end
  end
end
