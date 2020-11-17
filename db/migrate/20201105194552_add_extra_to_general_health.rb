class AddExtraToGeneralHealth < ActiveRecord::Migration[5.2]
  def change
    add_column :general_healths, :extra, :string
  end
end
