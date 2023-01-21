# frozen_string_literal: true

source 'https://rubygems.org'

ruby ::File.read('.ruby-version').split('-').last

# Application Dependencies
gem 'activesupport', '>= 6.1.7.1'
gem 'puma'
gem 'sinatra', require: false
gem 'sinatra-contrib'
gem 'sinatra-flash'

# Settings
gem 'config'

# Datastore Dependencies
gem 'actionpack', '>= 6.1.7.1', require: false
gem 'activerecord', '>= 6.1.7.1'
gem 'pg'
gem 'standalone_migrations', '>= 6.1.0'

# Rake & Job Dependencies
gem 'bundler-audit'
gem 'progressbar'
gem 'rake'

group :development, :test do
  gem 'capybara'
  gem 'factory_bot'
  gem 'faker'
  gem 'rack-test'
  gem 'racksh'
  gem 'rspec'
  gem 'rspec-json_expectations'
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'shoulda'
  gem 'simplecov', require: false
end
