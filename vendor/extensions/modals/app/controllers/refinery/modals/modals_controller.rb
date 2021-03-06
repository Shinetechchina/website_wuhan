module Refinery
  module Modals
    class ModalsController < ::ApplicationController

      before_filter :find_all_modals
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @modal in the line below:
        present(@page)
      end

      def show
        @modal = Modal.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @modal in the line below:
        present(@page)
      end

      def show_by_path
        @modal = Modal.find_by_path(params[:path])
        if @modal.present?
          respond_to do |format|
            format.js {render 'show'}
          end
        else
          render nothing: true, status: 404, content_type: 'text/html'
        end
      end

    protected

      def find_all_modals
        @modals = Modal.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/modals").first
      end

    end
  end
end
