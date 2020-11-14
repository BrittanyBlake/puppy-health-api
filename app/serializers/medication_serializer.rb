class MedicationSerializer < ActiveModel::Serializer
  attributes :id, :date, :time, :name, :use, :dosage, :user

     belongs_to :user
end
