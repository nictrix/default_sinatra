require "bundler"
Bundler.require

StandaloneMigrations::Tasks.load_tasks

%w(yarn:install dev:cache job:generic app:template app:update routes middleware).each do |task|
  Rake::Task[task].clear
end

Dir[File.dirname(__FILE__) + '/../../init.rb'].each {|file| require file }

unless ENV["APP_ENV"] == "production"
  require 'rspec'
  require 'rspec/core/rake_task'

  desc "Run specs"
  RSpec::Core::RakeTask.new :spec

  task :default => :spec
end

Dir[File.dirname(__FILE__) + '/lib/tasks/*.rake'].each {|file| import file }
