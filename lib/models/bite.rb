class Bite
    include DataMapper::Resource
    include DataMapper::Timestamp
    
    property :id, Serial
    property :title, String
    property :contents, Text

    timestamps :at
end