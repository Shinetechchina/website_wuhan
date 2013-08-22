module Refinery
  module Customs
    class CustomsController < ::ApplicationController

      before_filter :find_all_customs
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @custom in the line below:
        present(@page)
      end

      def show
        @custom = Custom.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @custom in the line below:
        present(@page)
      end

    protected

      def find_all_customs
        @customs = Custom.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/customs").first
      end

    end
  end
end
