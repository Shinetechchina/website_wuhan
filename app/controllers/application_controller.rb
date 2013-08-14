class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_tag

  # helper_method :tag

  def require_user
    if current_refinery_user.blank?
      respond_to do |format|
        format.html  {
          authenticate_refinery_user!
        }
        format.all {
          head(:unauthorized)
        }
      end
    end
  end

  protected

  def tag
    @tag ||= cookies[:tag].present? ? cookies[:tag] : nil
  end

  def set_tag
    tag = params[:tag]
    if tag.present?
      cookies[:tag] = tag == 'all' ? '' : tag
    end
  end

  def has_tag?
    tag.present?
  end
end
