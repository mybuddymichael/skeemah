Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'b2dc37d28144c5876735', '4af98d2148ffd041a1df68c5409088024ab2fc55'
end
