# frozen_string_literal: true

source 'https://rubygems.org'

ruby ::File.read('.ruby-version').split('-').last

# Application Dependencies
gem 'activesupport'
gem 'puma'
gem 'sinatra', '>= 2.0.5', require: false
gem 'sinatra-contrib', '>= 2.0.5'
gem 'sinatra-flash', '>= 0.3.0'

# Settings
gem 'config'

# Datastore Dependencies
gem 'actionpack', '>= 5.2.3', require: false
gem 'activerecord'
gem 'pg'
gem 'standalone_migrations', '>= 5.2.7'

# Rake & Job Dependencies
gem 'bundler-audit'
gem 'progressbar'
gem 'rake'

group :development, :test do
  gem 'capybara', '>= 3.26.0'
  gem 'factory_bot'
  gem 'faker'
  gem 'rack-test', '>= 1.1.0'
  gem 'racksh', '>= 1.0.0'
  gem 'rspec'
  gem 'rspec-json_expectations'
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'shoulda'
  gem 'simplecov', require: false
end
