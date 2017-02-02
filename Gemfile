source "https://rubygems.org"

#Application Dependencies
gem 'sinatra', '~> 1.3.5', :require => false # This change was made via Snyk to fix a vulnerability
gem "sinatra-contrib"
gem 'sinatra-flash'
gem "haml"
gem 'activesupport', '~> 3.2.22' # This change was made via Snyk to fix a vulnerability

#Datastore Dependencies
gem 'mysql2'
gem 'activerecord', '~> 3.2.22.1' # This change was made via Snyk to fix a vulnerability

#Rake & Job Dependencies
gem 'rake'
gem 'progressbar'

#Test Dependencies
group :test do
  gem 'rspec', :require => 'spec'
  gem 'rack-test'
  gem 'simplecov', '>= 0.4.0', :require => false
end
