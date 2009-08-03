require 'rubygems'
require 'sinatra/base'
require 'datamapper'
require 'haml'
require 'sass'

module Snacks
    class App < Sinatra::Base
       
        configure do
          root_path = Dir.pwd
          
          begin
            config = YAML.load_file("#{root_path}/config/application.yml")
          rescue Exception => e
            puts "Snacks couldn't load its config file. #{e}"
            exit
          end
          
          environment = ENV['RACK_ENV'] || 'development'
          
          DataMapper.setup(:default, "sqlite3:///#{root_path}/database/#{config[:database][environment.to_sym]}")
          DataMapper::Logger.new(STDOUT, :debug)

          %w[bite photo tweet].each do |model|
           require "#{root_path}/lib/#{model}.rb"
          end
          
          DataMapper.auto_migrate!
        end
     
        get "/" do
        end
    end
end