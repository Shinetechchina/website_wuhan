class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_tag

  # helper_method :tag

  protected

  def tag
    @tag ||= cookies[:tag].present? ? cookies[:tag].split(',') : []
  end

  def set_tag
    tag = params[:tag]
    if tag.present? && tag =~ /^\w+(,\w+)*$/
      cookies[:tag] = tag == 'all' ? '' : tag
    end
  end

  def has_tag?
    tag.present?
  end
end
