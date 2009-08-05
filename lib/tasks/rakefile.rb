require 'net/http'
require 'datamapper'
require 'json'

Dir.glob("#{Dir.pwd}/lib/*.rb") { |lib| require lib }

config = YAML.load_file('config/application.yml')

task :default do
  puts "\nThe default task\nThere is not a default task\nTry rake -T.\n\n"
end

namespace :fetch do
  desc "This fetches the latest information from flickr."
  task :flickr do
     
    base_uri = "http://api.flickr.com/services/rest"
    api_key = config[:services][:flickr][:api_key]
    json_extras = "&lang=en-us&format=json&nojsoncallback=1"
    user_method_options = "flickr.photos.search&user_id=#{URI.encode(config[:services][:flickr][:nsid])}"
    url = "#{base_uri}?api_key=#{api_key}&method=#{user_method_options}#{json_extras}"
        begin
      json_string = JSON.parse(Net::HTTP.get_response(URI.parse(url)).body)
      json_string['photos']['photo'].each do |photo|
        puts "---"
        photo_url = "http://api.flickr.com/services/rest/?api_key=#{URI.encode(config[:services][:flickr][:api_key])}&method=flickr.photos.getInfo&photo_id=#{photo['id']}&lang=en-us&format=json&nojsoncallback=1"
        puts photo_url
      end
      
      # puts json_string['photos']['photo'].inspect
    rescue Exception => e
      puts "Error :( #{e.inspect}"
      exit
    end
    
  end
  
  desc "This fetches the latest information from twitter."
  task :twitter do
    url = URI.parse("http://twitter.com/statuses/user_timeline/#{config[:services][:twitter][:username]}.json")
    req = Net::HTTP::Get.new(url.path)
    http = Net::HTTP.new(url.host,url.port)
    begin
      json_string = JSON.parse(http.request(req).body)
      puts json_string[0]["user"]["name"]
    rescue Exception => e
      puts "Error: #{e.inspect}"
      exit
    end
    # load up models and do db inserts here plz
  end
end
