class GeneralHealth < ApplicationRecord
  belongs_to :user
  validates_presence_of :date, :energy_level, :hunger_level
  
end
