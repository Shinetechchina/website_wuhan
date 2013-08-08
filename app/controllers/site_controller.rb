class SiteController < ApplicationController
  # layout false

  def home
    @clients = Refinery::Shinetech::Client.limit(3)
    @services = Refinery::Services::Service.limit(3)

    @technologies = Refinery::Technologies::Technology.limit(3)
    @staffs = Refinery::Staffs::Staff.order('name').limit(3)

    if has_tag?
      @technologies = @technologies.order_by_tag(tag)
      @staffs = @staffs.order_by_tag(tag)
    end

    if request.xhr?
      render layout: false
    end
  end

  def blog
    @blogs = Blog.all
  end
end
