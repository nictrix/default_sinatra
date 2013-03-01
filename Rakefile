require 'yaml'
require 'logger'
require 'active_record'
require 'active_support/core_ext'

Dir[File.dirname(__FILE__) + '/../../init.rb'].each {|file| require file }

unless ENV["RACK_ENV"] == "production"
  require 'rspec'
  require 'rspec/core/rake_task'

  desc "Run specs"
  RSpec::Core::RakeTask.new :spec

  task :default => :spec
end

namespace :db do
  def create_datastore config
    options = {:charset => 'utf8', :collation => 'utf8_unicode_ci'}
    grant_statement = nil

    create_db = lambda do |config|
      ActiveRecord::Base.establish_connection config.merge('database' => nil)
      ActiveRecord::Base.connection.create_database config['database'], options
      ActiveRecord::Base.establish_connection config
      ActiveRecord::Base.connection.execute(grant_statement) unless grant_statement.nil?
    end

    begin
      puts "Creating Datastore"
      create_db.call config
    rescue => error
      case error.to_s
      when /database exists/i
        puts "#{config['database']} datastore already exists"
      else
        puts error
        puts "\nPlease provide the root password for your datastore installation>"
        root_password = $stdin.gets.strip

        grant_statement = <<-SQL
          GRANT ALL PRIVILEGES ON #{config['database']}.*
          TO '#{config['username']}'@'#{config['host']}'
          IDENTIFIED BY '#{config['password']}' WITH GRANT OPTION;
        SQL

        create_db.call config.merge('database' => config['database'], 'username' => 'root', 'password' => root_password)
      end
    end
  end

  def drop_datastore config
    begin
      puts "Dropping Datastore"
      ActiveRecord::Base.connection.drop_database config['database']
    rescue => error
      puts error
    end
  end

  def refresh_datastore config
    drop_datastore config
    create_datastore config
    migrate_datastore config
    seed_datastore
  end

  def migrate_datastore config
    begin
      ActiveRecord::Migration.verbose = true
      ActiveRecord::Migrator.migrate MIGRATIONS_DIR, ENV['VERSION'] ? ENV['VERSION'].to_i : nil
    rescue => error
      case error.to_s
      when /unknown database/i
        puts "datastore does not exist, creating..."
        create_datastore config
        puts "now migrating datastore..."
        ActiveRecord::Migration.verbose = true
        ActiveRecord::Migrator.migrate MIGRATIONS_DIR, ENV['VERSION'] ? ENV['VERSION'].to_i : nil
      else
        puts error
      end
    end
  end

  def seed_datastore
    seed_file = "db/seed.rb"
    if File.exist?(seed_file)
      load(seed_file)
    end
  end

  task :environment do
    RACK_ENV = ENV['RACK_ENV'] || 'development'
    MIGRATIONS_DIR = ENV['MIGRATIONS_DIR'] || 'db/migrate'
  end

  task :configuration => :environment do
    @config = YAML.load_file('config/datastore.yml')[RACK_ENV]
  end

  task :configure_connection => :configuration do
    ActiveRecord::Base.establish_connection @config
    ActiveRecord::Base.logger = Logger.new STDOUT if @config['logger']
  end

  desc 'Create the datastore for the current environment'
  task :create => :configure_connection do
    create_datastore @config
  end

  desc 'Drops the datastore for the current environment'
  task :drop => :configure_connection do
    drop_datastore @config
  end

  desc 'Refreshes the datastore'
  task :refresh => :configure_connection do
    refresh_datastore @config
  end

  desc 'Migrate the datastore (options: VERSION=x, VERBOSE=false).'
  task :migrate => :configure_connection do
    migrate_datastore @config
  end

  desc 'Rolls the schema back to the previous version (specify steps w/ STEP=n).'
  task :rollback => :configure_connection do
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    ActiveRecord::Migrator.rollback MIGRATIONS_DIR, step
  end

  desc "Retrieves the current schema version number"
  task :version => :configure_connection do
    @current_version = ActiveRecord::Migrator.current_version.to_s
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end

  desc 'Load seed data'
  task :seed => :configure_connection do
    seed_datastore
  end
end

Dir[File.dirname(__FILE__) + '/lib/tasks/*.rake'].each {|file| import file }
