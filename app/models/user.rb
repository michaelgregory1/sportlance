class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :clients, through: :bookings, source: :user
  has_many :bookings, dependent: :destroy
  has_many :locations, inverse_of: :user, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_many :reviews
  mount_uploader :photo, PhotoUploader

  def check_available(time)
    availabilities.each do |a|
      return "available hour-block grid-item" if time.between?(a.date_start, a.date_end)
    end
    bookings.each do |b|
      return "booked hour-block grid-item" if time.between?(b.date_start, b.date_end)
    end
    return "unavailable hour-block grid-item"
  end

  def id_set(time)
    return time.to_s
  end

  include PgSearch
  pg_search_scope :global_search,
    against: [:first_name, :last_name, :sport, :price_per_hour, :abilities_taught],
    associated_against: {
      locations: [:address]
    },
    using: {
      tsearch: { prefix: true }
    }
end
