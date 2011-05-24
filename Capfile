load 'deploy' if respond_to?(:namespace)

default_run_options[:pty] = true

set :domain, "felixbellanger.com"
set :application, "felixbellanger"
set :deploy_to, "/var/www/felixbellanger/web"

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
    run "cd #{deploy_to}/current && nohup unicorn -D config.ru"
  end

  task :stop do
    run "killall unicorn"
  end

  task :restart do
    deploy.stop
    deploy.start
  end

  task :cold do
    deploy.update
    deploy.symlink_shared
    run "cd #{release_path} && bundle update"
    deploy.restart
  end

  task :symlink_shared do
    run "ln -s #{shared_path}/config #{release_path}"
  end
end

