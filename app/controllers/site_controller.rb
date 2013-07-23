class SiteController < ApplicationController
  # layout false

  def home
    @clients = Refinery::Shinetech::Client.limit(3)

    @techs = Refinery::Technologies::Technology.order('title').limit(3)
    @staffs = Refinery::Staffs::Staff.order('name').limit(3)

    if has_tag?
      @techs = @techs.tagged_with(tag, any: true)
      @staffs = @staffs.tagged_with(tag, any: true)
    end

    if request.xhr?
      render layout: false
    end
  end
end
