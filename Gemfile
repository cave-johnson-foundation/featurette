source 'http://rubygems.org'

gem 'rails',                '3.2.6'
gem 'jquery-rails',         '2.0.2'
gem 'haml-rails',           '0.3.4'
gem 'thin',                 '1.3.1'
gem 'pg',                   '0.14.0'
gem 'rack-canonical-host',  '0.0.8'
gem 'unicorn'
gem 'state_machine'
gem 'omniauth-facebook'
gem 'activeadmin'
gem "meta_search",    '>= 1.1.0.pre'
gem 'paperclip'
gem 'sidekiq'

# gem 'paperclip', '3.0.4'
# gem 'aws-sdk', '1.5.2'
# gem 'paranoia', '1.1.0'
# gem 'omniauth', '1.1.0'
# gem 'omniauth-facebook', '1.3.0'
# gem 'typus', '3.1.10'
# gem 'kaminari', '0.13.0'
# gem 'rdiscount', '1.6.8'
# gem 'acts_as_hashed', '0.0.2'

group :assets do
  gem 'sass-rails',         '3.2.5'
  gem 'compass-rails'
  gem 'coffee-rails',       '3.2.2'
  gem 'uglifier',           '1.2.6'
end

group :development do
  gem 'heroku',             '2.28.12'
  gem 'rspec-rails',        '2.11.0'
  gem 'integration', :git => 'git://github.com/mergulhao/integration.git'
  gem 'capistrano'
  gem 'rvm-capistrano'
end

group :test do
  gem 'rspec-rails',        '2.11.0'
  gem 'fakeweb',            '1.3.0'
  gem 'shoulda-matchers',   '1.1.0'
  gem 'timecop',            '0.3.5'
  gem 'simplecov', '0.6.1', :require => false
end

group :development, :test do
  gem 'factory_girl_rails', '1.7.0'
  gem 'pry-rails',          '0.1.6'
  gem 'awesome_print',      '1.0.2'
end
