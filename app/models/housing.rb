class Housing < ApplicationRecord
  has_many :near_stations, inverse_of: :housing
  accepts_nested_attributes_for :near_stations
end
