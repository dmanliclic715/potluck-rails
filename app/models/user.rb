class User < ApplicationRecord
  has_secure_password
  has_many :potlucks
  has_many :attendances
  has_many :attending_potlucks, through: :attendances, source: :potluck

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
