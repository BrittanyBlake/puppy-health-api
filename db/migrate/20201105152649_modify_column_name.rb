class ModifyColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :treats, :type, :treat_type
  end
end
