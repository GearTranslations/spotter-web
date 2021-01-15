role :app, %w(ubuntu@spotter.biz)
role :web, %w(ubuntu@spotter.biz)
role :db,  %w(ubuntu@spotter.biz)

set :ssh_options, keys: %w(~/.ssh/spotter-web.pem),
                  forward_agent: false

set :nginx_server_name, 'www.spotter.biz'
set :nginx_server_name_alias, %w(spotter.biz)
