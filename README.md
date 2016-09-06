Stream Example App
------------------

This example app shows you how you can use [GetStream.io](https://getstream.io/ "GetStream.io") to build a site similar 
to Pinterest.

If you have no idea what GetStream is: GetStream is an hosted API service that allows you to build activity feeds. It 
makes it very easy to build user activity feeds, public feeds, aggregated feeds and notification feeds. GetStream 
provides API clients in several language, in this example app we show how easy
is to create a website with activity feeds using Rails and [stream_rails](https://github.com/GetStream/Stream-Rails "stream_rails").

The application is built using Rails 4 and stream_rails. The best way to try this application in a production-like 
environment is via Heroku; you can deploy this example (for free) on Heroku by pressing the Deploy button below.

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

If you prefer to run this locally then make sure to generate the API keys on [GetStream.io](https://getstream.io/ "GetStream.io") 
and update the settings in `config/initializers/stream_rails.rb` (see below for configuration steps)

More information and code samples are available in [stream_rails](https://github.com/GetStream/stream-rails "stream_rails") 
documentation and in getstream.io [documentation](https://getstream.io/docs/ "documentation") pages.


## Setup 

This project requires Ruby 2.1.3, Rails 4.x  , and PostgreSQL.

### Setup steps at GetStream.io

On your [your dashboard at GetStream.io](https://getstream.io/dashboard/), create a new app by clicking the 'Create App'
button. Give the app a name like "rails example", and you can leave the other fields at their default values.

You will need to set up four feeds with the following names and types. Click on the 'Add Feed Group' button.
1. Feed name: `timeline_flat`, Feed type: `Flat`
1. Feed name: `timeline_aggregated`, Feed type: `Aggregated`
1. Feed name: `notification`, Feed type: `notification`
1. Feed name: `user`, Feed type: `Flat`

On your dashboard, when viewing your app, you will see an "App ID", which is a unique numeric ID for your application.
Make note of this value, you'll need it for your Rails settings below.


### Rails setup:

You will also need to modify the following configuration files:

##### config/secrets.yml
1. Within this file, you'll need to generate a new secret key to replace the string `SET_YOUR_SECRET_HERE`
1. Set the values for `admin_email`, `admin_password`, `email_provider_username`, and `email_provider_password`

##### config/database.yml
1. Within the `defaults` block, you will need to add `database: postgres`. This example project uses an `inet` field 
type for tracking IP addresses, which is specific to PostgreSQL. If you'd like to use a different database, expect to 
make further code changes outside of the scope of this document.
1. While our project doesn't include testing, if you want to develop tests, you will require a test database as well 
(which is undefined at the moment and so tests will not run correctly). Add a new item in the `test` group, something 
like `database: postgres-test` after the line `<<: *default`. Failure to set this will inherit the development database
settings for the test database, and sample data could be corrupted and/or removed.

##### config/initializers/stream_rails.rb
1. Set your values for `config.api_key`, `config.api_secret`, and `config.app_site_id`. The other settings for timeout, 
location, and feed names can remain as-is, provided that you have already set up these feed names at GetStream.io 

With these configurations in place, you will need to execute the following commands to install all of the gems, and
to set up your database:

``` 
$ bundle install 
$ rake db:create 
$ rake db:migrate 
```

## Running the Example App

After launching the Rails app (usually just `rails s` will suffice), you'll see a Pinterest-like web application at 
[http://localhost:3000/](http://localhost:3000/ "localhost") where you can pin/unpin items.

Within the application, visit the [People tab](http://localhost:3000/users "users") where you can 'follow' yourself. Once 
you 'follow' your own admin user, the [Flat Feed](http://localhost:3000/feed "flat feed") and
[Aggregated Feed](http://localhost:3000/aggregated "aggregated feed") pages will populate with items you pin on the
'Trending' page.

To track the API usage, you can visit [your dashboard at GetStream.io](https://getstream.io/dashboard/ "GetStream.io dashboard"),
click on your app name, and click on the 'Explorer' tab; you can also enable the Auto-Refresh setting on that page to 
see near real-time API activity. As you pin items, you will see events appear on your dashboard; as you un-pin items, 
you will see events disappear. Likewise, as you follow/unfollow users you will see elements appear and disappear the 
Explorer tab on GetStream.io
