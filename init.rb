ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

require 'rubygems'  
require 'bundler'

Bundler.setup

require 'monk/glue'
require 'mongo_mapper'


class Main < Monk::Glue
  set :app_file, __FILE__ 
  set :haml, { :format => :html5 }
  use Rack::Session::Cookie
end

# Connect to mongo database.
if ENV['MONGOHQ_HOST']
  puts "Running on MongoHQ" 
  MongoMapper.config = {RACK_ENV => {'uri' => ENV['MONGOHQ_URL']}}
  MongoMapper.connect(RACK_ENV)
else
  puts "Using local database" 
  MongoMapper.database = monk_settings(:mongo)[:database]
  MongoMapper.connection = Mongo::Connection.new(monk_settings(:mongo)[:host], nil, :logger => logger)
end

# Load all application files.
Dir[root_path('app/**/*.rb')].each do |file|
  require file
end

if defined? Encoding
  Encoding.default_external = Encoding::UTF_8
end

Main.run! if Main.run?
