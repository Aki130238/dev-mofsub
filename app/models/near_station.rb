class NearStation < ApplicationRecord
  belongs_to :housing, inverse_of: :near_stations
end
