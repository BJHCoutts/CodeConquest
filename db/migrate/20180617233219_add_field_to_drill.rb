class AddFieldToDrill < ActiveRecord::Migration[5.2]
  def change
    add_column :drills, :difficulty, :string
  end
end
