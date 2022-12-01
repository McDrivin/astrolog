class Topic < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :topic_members, dependent: :destroy
  has_many :users, through: :topic_members

  def find_topic_member(user)
    begin
      topic_members.find_by(user: user)
    rescue
      nil
    end
  end
end
