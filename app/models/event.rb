class Event < ApplicationRecord
  include PgSearch::Model
  # multisearchable against: [:name]
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  paginates_per 4
end
