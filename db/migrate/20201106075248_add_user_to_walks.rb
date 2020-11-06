class AddUserToWalks < ActiveRecord::Migration[5.2]
  def change
    add_reference :walks, :user, foreign_key: true
  end
end
