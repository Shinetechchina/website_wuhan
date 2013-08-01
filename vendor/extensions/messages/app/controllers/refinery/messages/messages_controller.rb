module Refinery
  module Messages
    class MessagesController < ::ApplicationController

      before_filter :find_all_messages
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @message in the line below:
        present(@page)
      end

      def create
        @message = Message.new(params[:message])
        respond_to do |format|
          if @message.save
            format.js { render js: "alert('Guest successful, we will contact you.'); $('#guest-bar').click();" }
          else
            format.js { render js: "alert('Guest failed, please input correctly format.')" }
          end
        end
      end

      def show
        @message = Message.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @message in the line below:
        present(@page)
      end

    protected

      def find_all_messages
        @messages = Message.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/messages").first
      end

    end
  end
end
