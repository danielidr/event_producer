class Group < ApplicationRecord
    has_many :concerts

    def to_s
        name
    end
    
end
