class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bikes
  has_many :messages
  has_many :rooms, through: :room_users
  has_many :room_users

  validates :nickname, presence: true
  validates :postal_code, presence: true
  validates :prefectures_id, presence: true
  validates :municipality, presence: true
  validates :address, presence: true
end
