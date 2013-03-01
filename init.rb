Encoding.default_internal = Encoding.default_external = 'UTF-8'

require "bundler"

Bundler.require

require 'sinatra'
require 'sinatra/flash'
require 'active_record'
require 'logger'
require 'socket'
require 'yaml'

environment = Sinatra::Application.environment.to_s

datastore = "config/datastore.yml"
settings = "config/settings.yml"
cookies = "config/cookies.yml"

datastore = YAML::load(File.open(datastore))[environment]
settings = YAML::load(File.open(settings_path))[environment]
cookies = YAML::load(File.open(cookies))[environment]

configure environment.to_sym do
  logfile = ::File.join(File.dirname(__FILE__),'log','application.log')
  class ::Logger; alias_method :write, :<<; end
  $logger = ::Logger.new(logfile,'weekly')
  $logger.level = Logger::WARN if environment == "production"

  set settings
  set :hostname, Socket.gethostname.downcase

  enable :logging
  unless environment == "production"
    enable :dump_errors, :raise_errors, :show_exceptions
    require 'sinatra/reloader'
    Sinatra::Application.also_reload '/lib/**/*.rb'
    Sinatra::Application.also_reload '/app/**/*.rb'
  end

  set :app_file, __FILE__
  set :views, "app/views"
  set :public_folder, "public"
  set :haml, { :attr_wrapper => '"', :format => :html5 }

  use Rack::Session::Cookie, :key => cookies['key'],:secret => cookies['secret'], :expire_after => cookies['expire']
  use Rack::CommonLogger, $logger

  begin
    ActiveRecord::Base.logger = $logger
    ActiveRecord::Base.establish_connection(datastore)
    use ActiveRecord::ConnectionAdapters::ConnectionManagement
  rescue => error
    $logger.warn error
  end
end

Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/app/**/*.rb'].each {|file| require file }
