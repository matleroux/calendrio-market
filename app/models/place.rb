class Place < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :max_capacity, presence: true
  validates :price, presence: true
  validates :availability, presence: true
  validates :user, presence: true
end
