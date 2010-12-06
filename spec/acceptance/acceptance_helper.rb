ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'init.rb')

require 'steak'
require 'capybara'
require 'capybara/dsl'
require 'faker'
require 'phony'

RSpec.configuration.include Capybara, :type => :acceptance

Capybara.app = Main

# Put your acceptance spec helpers inside /spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

