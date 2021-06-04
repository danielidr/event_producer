class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy
    enum group_type: [ :Band, :Women, :Men]
    validates_presence_of :name, :members

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
        #Concert.maximum(:concert_date).strftime("%Y,%B,%A")
        Concert.order('concert_date DESC').first.concert_date.strftime("%Y,%B,%A")
    end
    
    def max_audience
        #Concert.maximum(:audience)
        Concert.order('audience DESC').first.audience
    end
    
    def max_duration
        #Concert.maximum(:duration)
        Concert.order('duration DESC').first.duration
    end
end
