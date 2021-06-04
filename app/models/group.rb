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
        concerts.where('extract(month from concert_date) = ?', this_month).count
    end

    def last_concert
        max_concert = concerts.maximum(:concert_date)
        if max_concert != nil
            date_max_concert = max_concert.strftime("%Y,%B,%A")
        else
            return 'This group does not have any concert'
        end
        date_max_concert
    end
    
    def max_audience
        m_audience = concerts.maximum(:audience)
        if m_audience != nil
            return m_audience
        else
            return '---'
        end
    end
    
    def max_duration
        m_duration = concerts.maximum(:duration)
        if m_duration != nil
            return m_duration
        else
            return '---'
        end
    end
end
