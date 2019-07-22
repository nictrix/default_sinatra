# frozen_string_literal: true

unless ENV['APP_ENV'] == 'production'
  require 'rspec'
  require 'rspec/core/rake_task'

  desc 'Run specs'
  RSpec::Core::RakeTask.new :spec

  task default: :spec
end
