# config valid only for current version of Capistrano
lock '3.6.0'

set :application, 'spotter-web'
set :repo_url, 'git@github.com:GearTranslations/spotter-web.git'

set :deploy_via, :remote_cache
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :scm, :git

set :deploy_to, "/data/#{fetch :application}/"
set :log_level, :debug
set :keep_releases, 5

set :linked_dirs, %w[log tmp/sockets tmp/pids]

set :rbenv_type, :user
set :rbenv_ruby, '2.3.0'

set(
  :rbenv_prefix,
  "RBENV_ROOT=#{fetch(:rbenv_path)} " \
    "RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
)

set :rbenv_map_bins, %w(rake gem bundle ruby rackup racksh puma)
set :rbenv_roles, :all

set :nginx_use_ssl, true
set :nginx_ssl_certificate_path, '/etc/letsencrypt/live/www.spotter.biz/fullchain.pem'
set :nginx_ssl_certificate_key_path, '/etc/letsencrypt/live/www.spotter.biz/privkey.pem'

# TODO: Puma restart
