class CreateGeneralHealths < ActiveRecord::Migration[5.2]
  def change
    create_table :general_healths do |t|
      t.datetime :date
      t.integer :weight
      t.string :energy_level
      t.string :hunger_level

      t.timestamps
    end
  end
end
