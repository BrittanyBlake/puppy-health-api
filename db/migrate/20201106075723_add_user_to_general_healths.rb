class AddUserToGeneralHealths < ActiveRecord::Migration[5.2]
  def change
    add_reference :general_healths, :user, foreign_key: true
  end
end
