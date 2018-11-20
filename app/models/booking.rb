class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :location_id, presence: true
end
