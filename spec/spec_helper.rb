require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'webmock/rspec'
require 'sidekiq/testing'

# Require namespaced models and controllers
Dir[Rails.root.join("app/controllers/**/*.rb")].each {|f| require f}
Dir[Rails.root.join("app/models/**/*.rb")].each {|f| require f}

Dir[Rails.root.join("lib/**/*.rb")].each {|f| require f}

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }

# Checks for pending migrations before tests are run.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.fail_fast = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'
  config.use_transactional_fixtures = false

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
end

Capybara.javascript_driver = :webkit
WebMock.disable_net_connect!(allow_localhost: true)
