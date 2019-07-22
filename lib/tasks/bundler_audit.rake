# frozen_string_literal: true

require 'rake/tasklib'

module Bundler
  module Audit
    # Add Rake task
    class Task < Rake::TaskLib
      def initialize
        define
      end

      protected

      def define
        namespace :bundle do
          desc 'Updates the ruby-advisory-db then runs bundle-audit'
          task :audit do
            require 'bundler/audit/cli'
            %w[update check].each do |command|
              Bundler::Audit::CLI.start [command]
            end
          end
        end
      end
    end
  end
end

Bundler::Audit::Task.new
task default: 'bundle:audit'
