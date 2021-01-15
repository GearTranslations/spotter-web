source 'https://rubygems.org'

ruby '2.3.0'

# Sinatra
gem 'sinatra', '~> 1.4.7'
gem 'sinatra-assetpack'
gem 'sinatra-contrib'
gem 'sinatra-resources'
gem 'thin'

# Configuration
gem 'app_configuration'

# Front-end
gem 'coffee-script'
gem 'json'
gem 'less'
gem 'slim'
gem 'tilt', '~> 1.4.1' # Specify this gem version to avoid "undefined method `mappings' for Tilt:Module:" error
gem 'therubyracer'
gem 'uglifier'

# Internationalization/Localization
gem 'i18n'
gem 'i18n_data'

# Mails
gem 'pony'

# Mailchimp
gem 'gibbon'

# Parsing HTML/XML
gem 'nokogiri'

# Database adapter (SQLite)
gem 'dm-sqlite-adapter'

# Rollbar
gem 'rollbar'

# Development
group 'development' do
  # Debugging tools
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry'
  gem 'pry-nav'
  gem 'racksh'

  # Capistrano utils
  gem 'capistrano', '3.6.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv'
  gem 'capistrano3-puma', '1.2.1' # Specify this gem version to avoid "pumactl exit status: 127" error

  # Style
  gem 'rubocop', require: false
end

# Production
group 'production' do
  # Install puma server
  gem 'puma'
end
