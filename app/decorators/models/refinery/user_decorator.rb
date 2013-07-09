Refinery::User.class_eval do
  has_many :authentications, class_name: '::Authentication'

  accepts_nested_attributes_for :authentications, :roles
end
