class RenameTreatColumnInAppointmentsTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :appointments, :type, :appt_type
  end
end
