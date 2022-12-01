class Message < ApplicationRecord
  belongs_to :post
  belongs_to :user
end
