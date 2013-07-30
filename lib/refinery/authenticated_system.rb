#override refinery_user? method
Refinery::AuthenticatedSystem.class_eval do
  def refinery_user?
    !!(@current_refinery_user ||= request.env['warden'].try(:authenticate, :scope => :refinery_user))
  end
end
