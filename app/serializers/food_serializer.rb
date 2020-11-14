class FoodSerializer < ActiveModel::Serializer
  attributes :id, :brand, :amount, :date, :time, :user
  
  belongs_to :user
end
