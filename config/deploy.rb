set :rvm_ruby_string, '1.9.3@cave-johnson-foundation'
require "bundler/capistrano"
require "rvm/capistrano"
set :rvm_type, :system  # Copy the exact line. I really mean :system here

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
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@codeplane.com:startupdevrumble/cave-johnson-foundation.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases
