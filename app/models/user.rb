class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :postal_code, presence: true
  validates :prefectures_id, presence: true
  validates :municipality, presence: true
  validates :address, presence: true
end
