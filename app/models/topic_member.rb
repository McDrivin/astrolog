class TopicMember < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  enum :role, [:member, :creator]
end
