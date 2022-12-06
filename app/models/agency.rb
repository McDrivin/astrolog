class Agency < ApplicationRecord
  validates :logo_url, presence: true
  validates :name, uniqueness: true

  paginates_per 8
end
