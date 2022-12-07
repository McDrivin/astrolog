class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :topic_members, dependent: :destroy
  has_one_attached :photo

  validates :username, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
