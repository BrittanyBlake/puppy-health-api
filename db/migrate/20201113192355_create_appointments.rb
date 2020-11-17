class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :location
      t.string :type
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
