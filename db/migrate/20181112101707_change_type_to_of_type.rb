class ChangeTypeToOfType < ActiveRecord::Migration[5.2]
  def change
    rename_column :resources, :type, :of_type
  end
end
