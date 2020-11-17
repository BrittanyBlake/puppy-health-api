class CreateMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :use
      t.time :time
      t.date :date

      t.timestamps
    end
  end
end
