class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_tag

  # helper_method :tag

  protected

  def tag
    @tag ||= cookies[:tag]
  end

  def set_tag
    if params[:tag].present?
      cookies[:tag] = params[:tag]
    else
      cookies[:tag] = 'all' if cookies[:tag].blank?
    end
    cookies[:tag]
  end

  def has_tag?
    tag.present? && tag != 'all'
  end
end
