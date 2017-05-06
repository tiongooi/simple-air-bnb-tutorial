class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :user

  scope :approved, -> { where(approved: true, paid: false) }
  scope :pending, -> { where(approved: false) }
  scope :paid, -> {where(paid: true)}
end
