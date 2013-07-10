Refinery::UsersController.class_eval do
  def create_with_auth
    @user = Refinery::User.new(params[:user])
    @user.roles << Refinery::Role.find_or_create_by_title('User')
    @user.authentications << ::Authentication.find(params[:auth_id])
    @user.save!
    sign_in(@user)
    redirect_to '/'
  end
end
