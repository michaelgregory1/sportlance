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
end
