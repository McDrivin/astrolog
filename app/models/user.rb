class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :topic_members, dependent: :destroy

  validates :username, uniqueness: true, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
