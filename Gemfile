source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '>= 4.0.0'
gem 'sinatra', '>= 1.3.0', require: false

# utilities
gem 'oj'
gem 'dotenv-rails', groups: [:development, :test]

# debugging
gem 'pry'
gem 'pry-rails', group: :development

# background jobs
gem 'sidekiq'
gem 'sidetiq'
gem 'rerun', group: :development

# redis
gem 'redis-objects'

# databases
gem 'pg'

# caching
gem 'dalli'

# auth
# gem 'devise', '>= 3.1.0'
# gem 'pundit'

# views
gem 'slim-rails'
gem 'high_voltage'
gem 'draper'
# gem 'link_to_active_state'
# gem 'kaminari'
# gem 'redcarpet'

# mailers
# gem 'mail_view'
# gem 'maildown'

# performance
# gem 'rack-mini-profiler'

# services
gem 'puma'
gem 'email_validator'
gem 'rack-timeout'

# assets
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'anjlab-bootstrap-rails', '>= 3.0.0.0', require: 'bootstrap-rails'

group :development do
  # debugging
  gem 'better_errors', group: :development
  gem 'binding_of_caller', group: :development

  # browser reloads
  gem 'guard-livereload'
  gem 'rack-livereload'

  # mailers
  gem 'letter_opener'

  # utility
  gem 'foreman'
  gem 'quiet_assets'
end

group :development, :test do
  gem 'rspec-rails', '>= 2.14'
  gem 'debugger'
end

group :test do
  gem 'capybara-webkit', '>= 1.0.0'
  gem 'database_rewinder'
  gem 'fabrication'
  gem 'mocha'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
  gem 'vcr'
end

group :staging, :production do
  gem 'newrelic_rpm', '>= 3.6.7'
  gem 'rails_12factor'
  gem 'memcachier'
end
