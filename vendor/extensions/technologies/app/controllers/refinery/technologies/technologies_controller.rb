module Refinery
  module Technologies
    class TechnologiesController < ::ApplicationController

      before_filter :find_all_technologies
      # before_filter :find_page

      def index
        @technologies = Technology.scoped
        if has_tag?
          @technologies = @technologies.tagged_with(tag, any: true)
        end

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @technology in the line below:
        # present(@page)
        #
        if request.xhr?
          render layout: false
        end
      end

      # def show
      #   @technology = Technology.find(params[:id])

      #   # you can use meta fields from your model instead (e.g. browser_title)
      #   # by swapping @page for @technology in the line below:
      #   present(@page)
      # end

    protected

      def find_all_technologies
        @technologies = Technology.order('position ASC')
      end

      # def find_page
      #   @page = ::Refinery::Page.where(:link_url => "/technologies").first
      # end

    end
  end
end
