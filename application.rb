require 'rubygems'
require 'sinatra'
require 'datamapper'
require 'haml'
require 'sass'

configure do |app|
    begin
        config = YAML.load_file('config/application.yml')
        
        DataMapper.setup(:default, config[:database][app.environment])
    	
        Dir.glob('lib/models/*.rb') do |filename|
            require filename
	    end
	    
    rescue Exception => e
        puts "Error: #{e.inspect}"
        exit
    end
end

get "/" do
end

get "/tweets/?" do
    @tweets = Tweet.all
    haml :tweets
end