class Launch < ApplicationRecord
  geocoded_by :address, latitude: :pad_lat, longitude: :pad_lng
  after_validation :geocode, if: :will_save_change_to_address?
end
