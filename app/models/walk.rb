class Walk < ApplicationRecord
    validates_presence_of :distance, :time, :date
end
