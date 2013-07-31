module FirstUser
  def self.included(spec)
    spec.class_eval do
      before :each do
        if Refinery::User.all.blank?
          visit '/refinery/users/register'
          fill_in "user_username", with: 'username'
          fill_in "user_email", with: 'test@example.com'
          fill_in "user_password", with: 'password'
          fill_in "user_password_confirmation", with: 'password'
          click_button('Sign up')
          visit '/'
        end
      end

    end
  end
end
