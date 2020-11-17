class Food < ApplicationRecord
  belongs_to :user
  validates_presence_of :brand, :amount, :date, :time
end
