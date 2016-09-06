require 'stream_rails'

StreamRails.configure do |config|

  # you can find these details from your GetStream.io dashboard
  config.api_key     = ''
  config.api_secret  = ''
  config.api_site_id = ''

  config.timeout     = 30                # Optional, defaults to 3
  config.location    = 'us-east'         # Optional, defaults to 'us-east'

  # these are the example feeds in the demo app; make sure they match what you define for your application
  config.news_feeds = {flat: 'timeline_flat', aggregated: 'timeline_aggregated'}
  # Point to the notifications feed group providing the name, omit if you don't
  # have a notifications feed
  config.notification_feed = 'notification'
end
