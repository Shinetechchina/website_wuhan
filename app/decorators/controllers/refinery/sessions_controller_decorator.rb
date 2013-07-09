Refinery::SessionsController.class_eval do
  #TODO remove comment content if do not need sign up via auth
  def auth
    auth_hash = request.env['omniauth.auth']
    #username = auth_hash['info']['name']||auth_hash['info']['nickname']
    ::Authentication.find_or_create_from_auth_hash(auth_hash)
    flash[:message] = "Welcome #{auth_hash['info']['name']}, weibo authenticate successful"
    redirect_to '/'
    #if current_refinery_user
    #  @authentication.update_attributes(user_id: current_refinery_user.id)
    #  redirect_to '/'
    #else
    #  @user = Refinery::User.new(username: username)
    #  render 'refinery/users/new_with_auth'
    #end
  end

  #TODO remove the method and its view if do not need sign up via auth
  def auth_link
  end
end
