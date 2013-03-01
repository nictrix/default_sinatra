require 'simplecov'
SimpleCov.start

require File.dirname(__FILE__) + '/../init'
require 'rspec'
require 'rack/test'

set :environment, :test

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
