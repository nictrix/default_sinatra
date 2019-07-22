# frozen_string_literal: true

Encoding.default_internal = Encoding.default_external = 'UTF-8'

require 'bundler'

Bundler.require

require 'sinatra'
require 'sinatra/flash'
require 'sinatra/custom_logger'
require 'sinatra/json'
require 'active_record'
require 'action_dispatch/middleware/executor'
require 'logger'
require 'socket'
require 'yaml'

environment = Sinatra::Application.environment.to_s

# rubocop:disable Metrics/BlockLength
configure environment.to_sym do
  set :root, File.dirname(__FILE__)
  set :app_file, __FILE__
  set :views, 'app/views'
  set :public_folder, 'public'
  set :hostname, Socket.gethostname.downcase

  register Config

  logfile = ::File.join(File.dirname(__FILE__), 'log', 'application.log')
  $logger = ::Logger.new(logfile, 'daily')
  $logger.level = ::Logger::WARN if environment == 'production'

  enable :logging
  unless environment == 'production'
    enable :dump_errors, :raise_errors, :show_exceptions
    require 'sinatra/reloader'
    Sinatra::Application.also_reload '/lib/**/*.rb'
    Sinatra::Application.also_reload '/app/**/*.rb'
  end

  cookie_settings = { key: Settings.cookie['key'],
                      secret: Settings.cookie['secret'],
                      expire: Settings.cookie['expire'] }
  use Rack::Session::Cookie, cookie_settings
  use Rack::CommonLogger, $logger

  begin
    database = YAML.safe_load(ERB.new(File.read('config/database.yml')).result, aliases: true)[environment]

    ActiveRecord::Base.logger = $logger
    ActiveRecord::Base.establish_connection(database)
    use ActionDispatch::Executor, ActiveSupport::Executor
    ActiveRecord::QueryCache.install_executor_hooks
  rescue StandardError => e
    $logger.warn e
  end
end
# rubocop:enable Metrics/BlockLength

Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/app/**/*.rb'].each { |file| require file }
