Refinery::User.class_eval do
  has_many :authentications, class_name: '::Authentication'
end
