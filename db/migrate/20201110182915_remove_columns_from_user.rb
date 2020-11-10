class RemoveColumnsFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :breed
    remove_column :users, :goal_weight
    remove_column :users, :current_weight
    remove_column :users, :date_of_birth
  end
end
