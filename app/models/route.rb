class Route < ApplicationRecord
  belongs_to :user
  has_many :route_destinations, dependent: :destroy
  has_many :destinations, through: :route_destinations
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
end
