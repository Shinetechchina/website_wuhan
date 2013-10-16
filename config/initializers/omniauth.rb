Rails.application.config.middleware.use OmniAuth::Builder do
  provider :weibo, 4265702460, "945d13bc2350f60a746bf7425c7d3cb7"
  if Rails.env == 'development'
    provider :instagram, '772bfda5f27a40e7a400d86cee691266', '172749ce7f3746cb84ffeeaaf1402ec0'
  elsif Rails.env == 'production'
    provider :instagram, '3d16af84326c4137a771b563e9234d77', '44ea8d79fd9c405b8affa60e40f4d583'
  end
end
