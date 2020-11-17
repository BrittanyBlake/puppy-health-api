class CreateTreats < ActiveRecord::Migration[5.2]
  def change
    create_table :treats do |t|
      t.string :type
      t.integer :amount
      t.date :date

      t.timestamps
    end
  end
end
