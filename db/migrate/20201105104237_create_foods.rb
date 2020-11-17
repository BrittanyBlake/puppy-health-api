class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :brand
      t.integer :amount
      t.time :time
      t.date :date

      t.timestamps
    end
  end
end
