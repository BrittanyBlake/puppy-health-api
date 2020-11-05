class GeneralHealth < ApplicationRecord
    validates_presence_of :date, :energy_level, :hunger_level
end
