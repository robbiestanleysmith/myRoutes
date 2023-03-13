class RouteDestination < ApplicationRecord
  # acts_as_list
  belongs_to :route
  belongs_to :destination
  validates :destination, uniqueness: { scope: :route }
end
