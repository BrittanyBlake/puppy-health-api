class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :breed
      t.integer :goal_weight
      t.integer :current_weight
      t.datetime :date_of_birth

      t.timestamps
    end
  end
end
