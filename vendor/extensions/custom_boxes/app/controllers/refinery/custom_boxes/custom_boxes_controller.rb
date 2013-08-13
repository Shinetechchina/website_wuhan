module Refinery
  module CustomBoxes
    class CustomBoxesController < ::ApplicationController

      before_filter :find_all_custom_boxes
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @custom_box in the line below:
        present(@page)
      end

      def show
        @custom_box = CustomBox.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @custom_box in the line below:
        present(@page)
      end

    protected

      def find_all_custom_boxes
        @custom_boxes = CustomBox.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/custom_boxes").first
      end

    end
  end
end
