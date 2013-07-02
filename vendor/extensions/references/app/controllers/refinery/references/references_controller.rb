module Refinery
  module References
    class ReferencesController < ::ApplicationController
      def index
        @references = Reference.order('position ASC')
        @page = ::Refinery::Page.where(:link_url => "/references").first
        render layout: false
      end
    end
  end
end
