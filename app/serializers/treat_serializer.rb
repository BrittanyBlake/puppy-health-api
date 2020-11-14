class TreatSerializer < ActiveModel::Serializer
    attributes :id, :date, :treat_type, :amount, :user

    belongs_to :user
end