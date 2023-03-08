class Destination < ApplicationRecord
  belongs_to :user
  has_many :route_destinations
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
end
