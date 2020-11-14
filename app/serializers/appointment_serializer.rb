class AppointmentSerializer < ActiveModel::Serializer
      attributes :id, :date, :time, :location, :user

     belongs_to :user
end
