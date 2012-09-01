# -*- encoding : utf-8 -*-
namespace :integration do
  APP = 'cave-johnson-foundation'

end
namespace :capistrano do
  task :check do
    `cap integrate:check`
  end
  task :deploy do
    `cap deploy`
  end
  task :unlock do
    `cap integrate:unlock`
  end
end

INTEGRATION_TASKS = %w(
  capistrano:check
  integration:start
  integration:bundle_install
  db:migrate
  spec
  integration:finish
  capistrano:deploy
  capistrano:unlock
)
