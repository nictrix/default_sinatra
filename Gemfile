source "https://rubygems.org"

ruby ::File.read('.ruby-version').split('-').last

# Application Dependencies
gem 'puma'
gem 'sinatra', :require => false
gem "sinatra-contrib"
gem 'sinatra-flash'
gem 'activesupport'

# Settings
gem 'config'

# Datastore Dependencies
gem 'pg'
gem 'activerecord'
gem 'standalone_migrations'

# Rake & Job Dependencies
gem 'rake'
gem 'progressbar'
gem 'bundler-audit'

group :development, :test do
  gem 'factory_bot'
  gem 'faker'
  gem 'rspec-json_expectations'
  gem 'rspec'
  gem 'rack-test'
  gem 'capybara'
  gem 'racksh'
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'shoulda'
  gem 'simplecov', :require => false
end
