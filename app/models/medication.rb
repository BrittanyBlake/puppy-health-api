class Medication < ApplicationRecord
    validates_presence_of :name, :use, :dosage
    belongs_to :user
end
