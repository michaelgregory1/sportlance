class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :clients, through: :bookings, source: :user
  has_many :bookings
  has_many :locations
  has_many :availabilities
  has_many :reviews
  mount_uploader :photo, PhotoUploader
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
