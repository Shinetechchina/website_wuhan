module Refinery
  module AuthenticatedSystem
    def refinery_user?
      !!(@current_refinery_user ||= request.env['warden'].try(:authenticate, :scope => :refinery_user))
    end
  end
end
