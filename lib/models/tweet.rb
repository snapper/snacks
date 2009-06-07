class Tweet
    include DataMapper::Resource
    include DataMapper::Timestamp
    
    property :id, Serial
    property :tweet_id, Integer
    property :user_id, Integer
    property :contents, Text

    timestamps :at
end