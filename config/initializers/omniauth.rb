Rails.application.config.middleware.use OmniAuth::Builder do
  provider :weibo, 4265702460, "945d13bc2350f60a746bf7425c7d3cb7"
  provider :instagram, '772bfda5f27a40e7a400d86cee691266', '172749ce7f3746cb84ffeeaaf1402ec0'
end
