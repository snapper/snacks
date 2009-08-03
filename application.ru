ENV['RACK_ENV'] = "development"

require 'lib/application.rb'
run Snacks::App.new
