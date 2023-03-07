class RouteDestination < ApplicationRecord
  belongs_to :route
  belongs_to :destination
end
