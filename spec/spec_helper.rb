require "bundler"

Bundler.require

require 'simplecov'
SimpleCov.start

# Prevent database truncation if the environment is production
abort('The environment is running in production mode!') if ENV['APP_ENV'] == 'production'

require File.dirname(__FILE__) + '/../init'
require 'rspec'
require 'rack/test'
require 'shoulda/matchers'
require 'factory_bot'
require 'capybara/rspec'

Capybara.app = Sinatra::Application

set :environment, :test

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include FactoryBot::Syntax::Methods
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
  end
end

FactoryBot.definition_file_paths = %w{./spec/factories}
FactoryBot.find_definitions