class Astronaut < ApplicationRecord
  include PgSearch::Model
  # multisearchable against: [:agency, :name]
  pg_search_scope :search_by_name,
  against: [ :agency, :name ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
  paginates_per 8
end
