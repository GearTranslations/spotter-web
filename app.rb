# Setup bundler (dependencies)
require 'bundler'
Bundler.require

# Set load path
set :root, File.dirname(__FILE__)
set :actual_url, '/'
$LOAD_PATH.unshift settings.root

# Development
%w(pry sinatra/reloader).each { |f| require f } if development?

# Initialize
Dir["#{settings.root}/config/initializers/*.rb"].sort.each { |f| require f }

configure :development do
  %w(config/initializers models routes).each do |folder|
    also_reload "#{settings.root}/#{folder}/**/*.rb"
  end
end

configure do
  set :start_time, Time.now.utc
end

# Middlewares

require 'rollbar/middleware/sinatra'
# Middleware class
class MyApp < Sinatra::Base
  use Rollbar::Middleware::Sinatra
  # other middleware/etc
  # ...
end
