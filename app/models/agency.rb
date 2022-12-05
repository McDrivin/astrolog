class Agency < ApplicationRecord
  validates :logo_url, presence: true
  validates :name, uniqueness: true
end
