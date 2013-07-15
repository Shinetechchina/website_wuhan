class SiteController < ApplicationController
  layout false

  def home
    @customers = Refinery::Customers::Customer.order('name').limit(3)
    @techs = Refinery::Technologies::Technology.order('title').limit(3)
    @staffs = Refinery::Staffs::Staff.order('name').limit(3)

    if params[:tag].present?
      @customers = @customers.tagged_with(params[:tag], any: true)
      @techs = @techs.tagged_with(params[:tag], any: true)
      @staffs = @staffs.tagged_with(params[:tag], any: true)
    end
  end
end
