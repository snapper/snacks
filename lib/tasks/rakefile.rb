require 'net/http'
require 'datamapper'
require 'json'

#config = YAML.load_file('config/application.yml')

task :default do
  puts "\nThe default task\nThere is not a default task\nTry rake -T.\n\n"
end

namespace :fetch do
  desc "This fetches the latest information from flickr."
  task :flickr do
    url = URI.parse("http://api.flickr.com/services/feeds/photos_public.gne?id=#{URI.encode("NSID")}&lang=en-us&format=json&nojsoncallback=1")
    json = JSON.parse(Net::HTTP.get_response(url).body)  
    
    # load up models and do db insers here plz
  end
  
  desc "This fetches the latest information from twitter."
  task :twitter do
    url = URI.parse("http://twitter.com/statuses/user_timeline/TWITTERID.json")
    req = Net::HTTP::Get.new(url.path)
    http = Net::HTTP.new(url.host,url.port)
    json = JSON.parse(http.request(req).body)
    
    # load up models and do db insers here plz
  end
end
