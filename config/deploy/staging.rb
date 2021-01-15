role :app, %w(laura@192.168.1.70)
role :web, %w(laura@192.168.1.70)
role :db,  %w(laura@192.168.1.70)

set :ssh_options, keys: %w(~/.ssh/gt-web-stage.pem),
                  forward_agent: false

set :log_level, :debug
set :nginx_server_name, 'dev.geartranslations.com'
set :nginx_server_name_alias, %w(192.168.1.70)

set :pty, true

set :nginx_use_ssl, false
