class Launch < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:name]
  pg_search_scope :search_by_name,
  against: [ :name ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
  # geocoded_by :address, latitude: :pad_lat, longitude: :pad_lng
  # after_validation :geocode, if: :will_save_change_to_address?
end
