require "useragent"

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
          if leave_message?
            format.js {render "download_cv", locals: {cv_url: @staff.cv_url}}
          else
            format.js {render "new_download_cv_modal"}
          end
        end
      end

      def create
        prepare_user_agent!

        @message = Message.new(params[:message])
        #remain comment
        if @message.comment?
          respond_to do |format|
            if @message.save
              leave_message
              flash[:notice] = 'Guest successful, we will contact you.'
              format.js
            else
              error_message = @message.errors.messages.first.join(' ')
              flash[:error] = error_message
              format.js
            end
          end
        else
        #remain contact way
          if @message.save
            leave_message
            respond_to do |format|
              cv_url = @message.staff.cv_url
              format.js { render "download_cv", locals: {cv_url: cv_url} }
            end
          else
            error_message = @message.errors.messages.first.join(' ')
            flash[:error] = error_message
            format.js
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

      def leave_message?
        !!session[:leave_message]
      end

      def leave_message
        session[:leave_message] = true
      end

      def prepare_user_agent!
        user_agent = ::UserAgent.parse request.env['HTTP_USER_AGENT']
        platform = user_agent.platform
        from_ip  = request.env["REMOTE_ADDR"]
        browser = "#{user_agent.browser} #{user_agent.version}"
        params[:message].merge!(from_ip: from_ip, browser: browser, platform: platform)
      end
    end
  end
end
