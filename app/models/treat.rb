class Treat < ApplicationRecord
      validates_presence_of :type, :amount, :date
end
