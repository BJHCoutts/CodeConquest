class RemoveFieldFromDrillGroup < ActiveRecord::Migration[5.2]
  def change
    remove_column :drill_groups, :difficulty, :string
  end
end
