# frozen_string_literal: true

source 'https://rubygems.org'

ruby ::File.read('.ruby-version').split('-').last

# Application Dependencies
gem 'activesupport', '>= 6.1.7.5'
gem 'puma'
gem 'sinatra', require: false
gem 'sinatra-contrib'
gem 'sinatra-flash'

# Settings
gem 'config', '>= 2.1.0'

# Datastore Dependencies
gem 'actionpack', '>= 6.1.7.5', require: false
gem 'activerecord', '>= 6.1.7.5'
gem 'pg'
gem 'standalone_migrations', '>= 6.1.0'

# Rake & Job Dependencies
gem 'bundler-audit'
gem 'progressbar'
gem 'rake'

group :development, :test do
  gem 'capybara'
  gem 'factory_bot', '>= 5.1.0'
  gem 'faker'
  gem 'rack-test'
  gem 'racksh'
  gem 'rspec'
  gem 'rspec-json_expectations'
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'shoulda', '>= 4.0.0'
  gem 'simplecov', require: false
end
