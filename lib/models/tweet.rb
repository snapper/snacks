class Tweet
    include DataMapper::Resource
    include DataMapper::Timestamp
    
    property :id, Serial
    property :contents, Text

    timestamps :at
end