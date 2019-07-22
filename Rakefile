# frozen_string_literal: true

require 'bundler'
Bundler.require

StandaloneMigrations::Tasks.load_tasks

%w[yarn:install dev:cache job:generic app:template app:update routes middleware].each do |task|
  Rake::Task[task].clear
end

Dir[File.dirname(__FILE__) + '/../../init.rb'].each { |file| require file }
