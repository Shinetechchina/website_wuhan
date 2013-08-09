Refinery::User.class_eval do
  has_many :authentications, class_name: '::Authentication'

  def is_admin?
    admin_role = Refinery::Role.find_by_title("Refinery")
    self.roles.include? admin_role
  end
end
