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

if configatron.twitter.username.nil?
  configatron.twitter.username = ENV['TWITTER_USERNAME']
end
if configatron.twitter.password.nil?
  configatron.twitter.password = ENV['TWITTER_PASSWORD']
end
if configatron.twitter.ignore.nil?
  configatron.twitter.password = ENV['TWITTER_IGNORE'].split(",")
end
