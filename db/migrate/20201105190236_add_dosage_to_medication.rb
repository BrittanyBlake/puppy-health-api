class AddDosageToMedication < ActiveRecord::Migration[5.2]
  def change
    add_column :medications, :dosage, :string
  end
end
