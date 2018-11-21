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

  def check_available(time)
    availabilities.each do |a|
      return "available hour-block grid-item" if time.between?(a.date_start, a.date_end)
    end
    return "unavailable hour-block grid-item"
  end
end
