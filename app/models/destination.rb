class Destination < ApplicationRecord
  belongs_to :user
  has_many :routes, dependent: :destroy
end
