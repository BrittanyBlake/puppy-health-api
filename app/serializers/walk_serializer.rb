class WalkSerializer < ActiveModel::Serializer
  attributes :id, :date, :time, :distance, :user

     belongs_to :user
end
