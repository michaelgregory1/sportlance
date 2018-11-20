class Availability < ApplicationRecord
  belongs_to :user
  validates :date_start, presence: true
  validates :date_end, presence: true

  private

  def check_dates
    if date_start >= date_end
      errors.add(:date_start, "Your lesson must start before it ends")
    elsif date_start < DateTime.now
      errors.add(:date_start, "Your lesson must start before now")
    elsif date_end < DateTime.now
      errors.add(:date_end, "Your lesson cant end before now")
    end
  end
end
