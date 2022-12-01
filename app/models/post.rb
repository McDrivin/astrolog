class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :messages
end
