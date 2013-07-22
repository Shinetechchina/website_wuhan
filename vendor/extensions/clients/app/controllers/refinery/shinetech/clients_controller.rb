module Refinery
  module Shinetech
    class ClientsController < ::ApplicationController

      before_filter :find_all_clients
      # before_filter :find_page

      def index
        # # you can use meta fields from your model instead (e.g. browser_title)
        # # by swapping @page for @client in the line below:
        # present(@page)
      end

      # def show
      #   @client = Client.find(params[:id])

      #   # you can use meta fields from your model instead (e.g. browser_title)
      #   # by swapping @page for @client in the line below:
      #   present(@page)
      # end

      protected

      def find_all_clients
        @clients = Client.order('position ASC')
      end

      # def find_page
      #   @page = ::Refinery::Page.where(:link_url => "/clients").first
      # end

    end
  end
end
