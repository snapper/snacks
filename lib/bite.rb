class Bite
    include DataMapper::Resource
    include DataMapper::Timestamp
    
    property :id, Serial
    property :title, String
    property :url, String
    property :type, Discriminator
    property :creator, String
    property :contents, Text

    timestamps :at
end