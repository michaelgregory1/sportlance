class Review < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: { in: 10..300 }
  def blank_stars
    5 - rating.to_i
  end
end
