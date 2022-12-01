class Topic < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :topic_members, dependent: :destroy
end
