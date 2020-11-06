class Walk < ApplicationRecord
    validates_presence_of :distance, :time, :date
    belongs_to :user
end
