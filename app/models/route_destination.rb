class RouteDestination < ApplicationRecord
  belongs_to :route
  belongs_to :destination
  validates :destination, uniqueness: { scope: :route }
end
