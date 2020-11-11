class User < ApplicationRecord
  has_secure_password
  
  has_many :foods
  has_many :treats
  has_many :walks
  has_many :medications
  has_many :general_healths
  validates_presence_of :name, :email, :password_digest
end
