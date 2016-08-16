class Booking < ApplicationRecord
  belongs_to :place
  belongs_to :user

  enum status: [:pending, :confirmed, :rejected]

  validates :duration, presence: true
  validates :number_of_participants, presence: true
  validates :start_time, presence: true
  validates :status, presence: true
  validates :place, presence: true
  validates :user, presence: true
end
