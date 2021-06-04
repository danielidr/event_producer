class Concert < ApplicationRecord
  belongs_to :group
  validates_presence_of :name, :concert_date, :duration, :audience
  validates :duration, numericality: { greater_than: 0, less_than: 30000 }
  validates :audience, numericality: { greater_than: 0, less_than: 500000 }
end
