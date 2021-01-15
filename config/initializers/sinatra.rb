configure do
  set :sockets, []
  set :sessions, true

  set :application_color, '#e58235'
end

configure :development do
  require 'better_errors'

  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

# Rollbar config (Put in this file to avoid errors)
Rollbar.configure do |config|
  # Without configuration, Rollbar is enabled in all environments.
  # To disable in specific environments, set config.enabled=false.

  config.access_token = AppConfiguration.for(:rollbar).access_token

  # Here we'll disable in 'test' and 'development'; only 'stage' and 'production':
  if test? || development?
    config.write_to_file = true
    config.filepath = settings.root + 'log/rollbar.log'
  end
end
