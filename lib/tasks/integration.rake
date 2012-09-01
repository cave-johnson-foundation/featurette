# -*- encoding : utf-8 -*-
namespace :integration do
  APP = 'cave-johnson-foundation'

end
namespace :capistrano do
  task :deploy do
    `system cap deploy`
  end
end

INTEGRATION_TASKS = %w(
  integration:start
  integration:bundle_install
  db:migrate
  spec
  integration:finish
  capistrano:deploy
)
