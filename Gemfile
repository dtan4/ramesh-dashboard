source 'https://rubygems.org'

gem 'rails', '4.1.5'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'slim-rails'

gem 'autoprefixer-rails'
gem 'bootstrap-sass', '~> 3.2.0'

gem 'carrierwave'
gem 'fog'
gem 'mini_magick'

gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'ramesh', '~> 1.3.0'

gem 'whenever', require: false

group :test do
  gem 'timecop'
  gem 'webmock'
end

group :development, :test do
  gem 'coveralls', require: false
  gem 'database_rewinder'
  gem 'rspec-rails', '~> 3.0.0'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', require: false
  gem 'sqlite3'
end

group :development do
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'capistrano', '~> 3.2.0'
  gem 'guard-rspec'
  gem 'guard-rails_best_practices'
  gem 'pry-rails'
  gem 'quiet_assets'
  gem 'rails_best_practices'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'terminal-notifier-guard'
end

group :production do
  ruby "2.1.2"

  gem 'newrelic_rpm'
  gem 'pg'
  gem 'rails_12factor'
  gem 'unicorn'
end
