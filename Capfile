load 'deploy' if respond_to?(:namespace)

default_run_options[:pty] = true

set :domain, "felixbellanger.com"
set :application, "felixbellanger"
set :deploy_to, "/var/www/felixbellanger/dev/"

set :user, "felixbellanger"
set :use_sudo, false

set :scm, :git
set :repository, "git://github.com/Keeguon/felixbellanger.git"
set :git_shallow_clone, 1

set :deploy_via, :remote_cache

role :app, domain
role :web, domain

namespace :deploy do
  task :start do
    run "cd #{deploy_to}/current && nohup unicorn config.ru"
  end
end

