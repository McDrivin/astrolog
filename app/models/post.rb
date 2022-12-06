class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_rich_text :content

  paginates_per 5
end
