require "json"

class Article < ApplicationRecord
  include PgSearch::Model
  # multisearchable against: [:title]
  pg_search_scope :search_by_title,
  against: [ :title ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
  paginates_per 5
end
