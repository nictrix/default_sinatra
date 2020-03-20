# frozen_string_literal: true

source 'https://rubygems.org'

ruby ::File.read('.ruby-version').split('-').last

# Application Dependencies
gem 'activesupport'
gem 'puma'
gem 'sinatra', require: false
gem 'sinatra-contrib'
gem 'sinatra-flash'

# Settings
gem 'config'

# Datastore Dependencies
gem 'actionpack', '>= 5.2.4.2', require: false
gem 'activerecord'
gem 'pg'
gem 'standalone_migrations', '>= 5.2.7'

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
  gem 'simplecov', '>= 0.17.0', require: false
end
