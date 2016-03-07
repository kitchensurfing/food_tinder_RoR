source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails'

gem 'haml-rails' # Complicated alternative to ERB
gem 'active_model_serializers' # JSON serialization
gem 'analytics-ruby', '~> 2.0.0', :require => 'segment/analytics' # Segment.io
gem 'angular_rails_csrf' # CSRF token verification for Angular HTTP requests
gem 'dalli' # memcacheddd
gem 'memcachier' # Sets MEMCHACHE_ environment variables for Dalli
gem 'devise', '3.1.1' # Auth
gem 'doorkeeper' # OAuth 2.0 provider
gem 'filepicker-rails' # Used for uploading images to S3 (replacement our legacy uploader)
gem 'geocoder' # Geo ip identifications
gem 'highline', require: false
gem 'honeybadger' # He don't care about errors
gem 'httparty'
gem 'i18n-js', '>= 3.0.0.rc1' # Make Rails translations available in JavaScript
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'koala' # Facebook API
gem 'mixpanel_client', require: false
gem 'newrelic_rpm'
gem 'omniauth-facebook', '= 3.0.0' # Facebook Login
gem 'pg' # Postgres
gem 'unicorn' # Web server
gem 'turbolinks'
gem 'uglifier'

group :production do
  gem 'rails_12factor'
end

gem 'bourbon', '3.2.1'
gem 'coffee-rails'
gem 'sass'
gem 'sass-rails'
gem 'haml_assets', '~> 0.2.1'

group :development do
  gem 'descriptive-statistics'
  gem 'binding_of_caller'
  gem 'foreman', require: false
  gem 'pivotal_git_scripts'
  gem 'spring-commands-rspec'
  gem 'thin'
  gem 'quiet_assets'
  gem 'rubocop', '~> 0.37.2', require: false
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'fakeredis', :require => 'fakeredis/rspec'
  gem 'rb-fchange', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-inotify', :require => false
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false
  gem 'timecop'
  gem 'vcr'
  gem 'webmock', '~> 1.13.0'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'jasmine-rails'
  gem 'parallel_tests'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'sunspot_solr'

  # Required to FactoryGirl from console
  gem 'factory_girl_rails'
end

