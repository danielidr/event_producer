class Group < ApplicationRecord
    has_many :concerts
    enum group_type: [ :Band, :Women, :Men]

    def to_s
        name
    end
    
    def concerts_count
        concerts.count
    end
    
end
