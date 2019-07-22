Encoding.default_internal = Encoding.default_external = 'UTF-8'

require "bundler"

Bundler.require

require 'sinatra'
require 'sinatra/flash'
require 'sinatra/custom_logger'
require "sinatra/json"
require 'active_record'
require 'logger'
require 'socket'
require 'yaml'

environment = Sinatra::Application.environment.to_s

configure environment.to_sym do
  set :root, File.dirname(__FILE__)
  set :app_file, __FILE__
  set :views, "app/views"
  set :public_folder, "public"
  set :hostname, Socket.gethostname.downcase
  
  register Config

  logfile = ::File.join(File.dirname(__FILE__),'log','application.log')
  class ::Logger; alias_method :write, :<<; end
  $logger = ::Logger.new(logfile,'daily')
  $logger.level = Logger::WARN if environment == "production"

  enable :logging
  unless environment == "production"
    enable :dump_errors, :raise_errors, :show_exceptions
    require 'sinatra/reloader'
    Sinatra::Application.also_reload '/lib/**/*.rb'
    Sinatra::Application.also_reload '/app/**/*.rb'
  end

  use Rack::Session::Cookie, key: Settings.cookie['key'], secret: Settings.cookie['secret'], expire: Settings.cookie['expire']
  use Rack::CommonLogger, $logger

  begin
    ActiveRecord::Base.logger = $logger
    ActiveRecord::Base.establish_connection(database)
    use ActiveRecord::ConnectionAdapters::ConnectionManagement
  rescue => error
    $logger.warn error
  end
end

Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/app/**/*.rb'].each {|file| require file }
