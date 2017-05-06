class Room < ApplicationRecord
  belongs_to :user
  has_many :bookings
  
  validates :title, presence: true, length: { minimum: 2 }

  mount_uploaders :images, RoomUploader
  serialize :images, JSON

  def fancy_price_estimator
  	135
  end
end
