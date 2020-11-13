class Appointment < ApplicationRecord
    validates_presence_of :location, :type, :date, :time
    belongs_to :user
end
