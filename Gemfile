source 'https://rubygems.org'
ruby "2.1.1"

gem 'rails', '3.2.13'

# postgres client
gem 'pg'
gem 'jquery-rails'
gem 'devise', '2.1.0'
gem 'haml-rails'
gem 'will_paginate', "~> 3.0"
gem 'geokit-rails'
#gem "airbrake"
gem "hominid"
gem "rails_config", "= 0.2.5"
gem "omniauth", ">= 1.0"
gem "omniauth-twitter"
gem "omniauth-linkedin"
gem "linkedin", '~> 0.3.7'
gem 'acts-as-taggable-on', '~> 2.3.1'
gem "paperclip", "~> 3.0"
gem 'jwt', '0.1.11'
#gem 'aws-s3'
#gem 'aws-sdk'
gem 'formtastic'
gem 'rails_admin' # full admin package
gem 'backup', "~> 3.0.24" # db backup
gem 'whenever' # cron scheduling
gem 'resque'
gem 'resque-scheduler', :require => 'resque_scheduler' # delayed jobs in resque
gem 'exception_notification'
gem 'json', '~> 1.7.3' # much faster than activerecord -- http://flori.github.com/json/
gem 'ancestry' # for threaded comments
gem 'carrierwave' # file/image attachments
gem 'rmagick' # image resizing
gem 'mime-types' # for assigning mime type on upload
gem 'fog' # S3 upload for carrierwave
gem 'cancan', '~> 1.6.8'
gem 'sunspot_rails' # for use with solr
gem 'sunspot_solr' # pre-packaged solr distro for use in dev
gem 'progress_bar' # shows solr indexing progress
gem 'bitmask_attributes'
gem 'paper_trail', '~> 2.6.3'
gem 'slope_one'
gem 'rails_autolink'
gem 'viddler-ruby'
gem 'vimeo'
gem "obfuscate_id", :git => 'git://github.com/geeosh/obfuscate_id.git'
gem 'twitter'
gem 'opentok', '~> 0.0.91' # tokbox gem
gem 'geoip'
gem 'remotipart' # ajax file uploads
gem 'twilio-ruby'

group :test, :development do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
  gem 'rspec'
  gem 'rspec-rails', '2.10.1'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'capistrano'
  gem 'rvm-capistrano'
  gem 'timecop'
  gem 'guard'
  gem 'rb-fsevent' #, :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'spork'
  gem 'guard-spork'
  gem 'debugger'
  gem 'terminal-notifier-guard' # instead of growl for mountain lion notifications
  #gem 'jasmine-rails' # also need to do: brew install qt
end

group :development do
  gem "better_errors"
  gem 'binding_of_caller'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'turbo-sprockets-rails3'
end

group :production do
  gem 'thin'
  gem 'rails_12factor'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'
