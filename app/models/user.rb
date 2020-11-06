class User < ApplicationRecord
    has_secure_password
    has_many :foods
    has_many :treats
    has_many :walks
    validates_presence_of :name, :email, :password_digest, :breed, :weight, :date_of_birth

end
