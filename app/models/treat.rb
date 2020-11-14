class Treat < ApplicationRecord
  belongs_to :user
  validates_presence_of :treat_type, :amount, :date
end
