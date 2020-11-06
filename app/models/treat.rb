class Treat < ApplicationRecord
  validates_presence_of :treat_type, :amount, :date
  belongs_to :user
end
