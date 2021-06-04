class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy
    enum group_type: [ :Band, :Women, :Men]

    def to_s
        name
    end
    
    def concerts_count
        concerts.count
    end

    def concerts_this_month
        this_month = Time.now.month
        Concert.where('extract(month from concert_date) = ?', this_month).count
    end

    def last_concert
        Concert.maximum(:concert_date).strftime("%Y,%B,%A")
    end
    
    def max_audience
        Concert.maximum(:audience)
    end
    
    def max_duration
        Concert.maximum(:duration)
    end
end
