class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :breed
      t.integer :goal_weight
      t.integer :current_weight

      t.timestamps
    end
  end
end
