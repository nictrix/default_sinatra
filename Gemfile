# frozen_string_literal: true

source 'https://rubygems.org'

ruby ::File.read('.ruby-version').split('-').last

# Application Dependencies
gem 'activesupport', '>= 5.2.4.3'
gem 'puma', '>= 4.3.5'
gem 'sinatra', require: false
gem 'sinatra-contrib'
gem 'sinatra-flash'

# Settings
gem 'config', '>= 2.0.0'

# Datastore Dependencies
gem 'actionpack', '>= 5.2.4.3', require: false
gem 'activerecord', '>= 5.2.4.3'
gem 'pg'
gem 'standalone_migrations', '>= 5.2.7'

# Rake & Job Dependencies
gem 'bundler-audit'
gem 'progressbar'
gem 'rake'

group :development, :test do
  gem 'capybara'
  gem 'factory_bot', '>= 5.0.2'
  gem 'faker'
  gem 'rack-test'
  gem 'racksh'
  gem 'rspec'
  gem 'rspec-json_expectations'
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'shoulda', '>= 3.6.0'
  gem 'simplecov', require: false
end
