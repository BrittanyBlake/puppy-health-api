class Appointment < ApplicationRecord
  belongs_to :user
  validates_presence_of :location, :date, :time
  
end
