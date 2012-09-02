require "bundler/capistrano"
require "rvm/capistrano"
set :rvm_type, :system  # Copy the exact line. I really mean :system here

set :rvm_ruby_string, '1.9.3@cave-johnson-foundation'
load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/check"

server "199.231.86.38", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "featurette"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :copy
set :copy_strategy, :export
set :use_sudo, false

set :scm, "git"
set :repository, "git@codeplane.com:startupdevrumble/cave-johnson-foundation.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases
def current_user
  `whoami`.strip
end
def others_deploying?
  if 'true' == capture("if ls /tmp/deploying_* &> /dev/null; then echo 'true'; fi").strip
    if ('false' == capture("if [ -e /tmp/deploying_#{current_user}]; then echo 'false'; fi").strip)
      false
    else
      true
    end
  end
end
namespace :integrate do
  task :check do
    raise "Someone is currently deploying" if others_deploying?
  end
  task :lock do
    run "touch /tmp/deploying_#{current_user}"
  end
  task :unlock do
    run "rm /tmp/deploying_#{current_user}"
  end
end
