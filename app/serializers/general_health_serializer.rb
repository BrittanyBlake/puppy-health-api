class GeneralHealthSerializer < ActiveModel::Serializer
  attributes :id, :date, :weight, :energy_level, :hunger_level, :user

     belongs_to :user
end
