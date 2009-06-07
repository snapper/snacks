class Bite
    include DataMapper::Resource
    include DataMapper::Timestamp
    
    property :id, Serial

    timestamps :at
end