module Refinery
  module References
    class ReferencesController < ::ApplicationController
      def index
        @references = Reference.order('position ASC')
        @page = ::Refinery::Page.where(:link_url => "/references").first
      end
    end
  end
end
