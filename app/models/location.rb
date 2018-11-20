class Location < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :longitude, presence: true, numericality: { only_float: true }
  validates :latitude, presence: true, numericality: { only_float: true }
end
