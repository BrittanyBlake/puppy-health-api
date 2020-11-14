class Medication < ApplicationRecord
   belongs_to :user
  validates_presence_of :name, :use, :dosage
 
end
