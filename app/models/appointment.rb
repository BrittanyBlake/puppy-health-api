class Appointment < ApplicationRecord
    validates_presence_of :location, :date, :time
    belongs_to :user
end
