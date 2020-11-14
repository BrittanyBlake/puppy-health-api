class Walk < ApplicationRecord
  belongs_to :user
  validates_presence_of :distance, :time, :date
  
end
