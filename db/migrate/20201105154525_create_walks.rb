class CreateWalks < ActiveRecord::Migration[5.2]
  def change
    create_table :walks do |t|
      t.date :date
      t.time :time
      t.integer :distance

      t.timestamps
    end
  end
end
