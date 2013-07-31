Refinery::SessionsController.class_eval do
  def auth
    auth_hash = request.env['omniauth.auth']
    ::Authentication.find_or_create_from_auth_hash(auth_hash)
    auth_hash["credentials"]["token"]
    flash[:message] = "Welcome #{auth_hash['info']['name']}, weibo authenticate successful"
    redirect_to '/'
  end

  #TODO remove the method and its view if do not need sign up via auth
  def auth_link
  end
end
