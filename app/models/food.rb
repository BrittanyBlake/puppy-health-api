class Food < ApplicationRecord
  validates_presence_of :brand, :amount, :date, :time
  belongs_to :user
end
