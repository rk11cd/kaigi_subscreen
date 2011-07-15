configatron.configure_from_yaml("config/config.yml")

if configatron.pusher.app_id.nil?
  configatron.pusher.app_id = ENV['PUSHER_APP_ID']
end
if configatron.pusher.key.nil?
  configatron.pusher.key = ENV['PUSHER_KEY']
end
if configatron.pusher.secret.nil?
  configatron.pusher.secret = ENV['PUSHER_SECRET']
end

if configatron.basic_authentication.username.nil?
  configatron.basic_authentication.username = ENV['BASIC_USERNAME']
end
if configatron.basic_authentication.password.nil?
  configatron.basic_authentication.password = ENV['BASIC_PASSWORD']
end
