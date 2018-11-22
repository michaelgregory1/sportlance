class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :location_id, presence: true

  after_save :destroy_corresponding_availability

  def destroy_corresponding_availability
    a = Availability.find_by(date_start: date_start, date_end: date_end, user_id: user_id)
    a&.destroy
  end
end
