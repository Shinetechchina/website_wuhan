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

      def new
        @staff = Refinery::Staffs::Staff.find(params[:staff_id])
        respond_to do |format|
          format.js {render "new_download_cv_modal"}
        end
      end

      def create
        @message = Message.new(params[:message])
        #remain comment
        if @message.comment?
          respond_to do |format|
            if @message.save
              format.js { render js: "alert('Guest successful, we will contact you.'); $('#guest-bar').click();" }
            else
              format.js { render js: "alert('Guest failed, please input correctly format.')" }
            end
          end
        else
        #remain contact way
          if @message.save
            respond_to do |format|
              cv_url = @message.staff.cv_url
              format.js { render "download_cv", locals: {cv_url: cv_url} }
            end
          else
            render js: 'alert("Please remain correct information")'
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
