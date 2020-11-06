class User < ApplicationRecord
    has_secure_password
    has_many :foods
    has_many :treats
    has_many :walks
    has_many :medications
    validates_presence_of :name, :email, :password_digest, :breed, :weight, :date_of_birth

end
