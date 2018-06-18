class CreateDrills < ActiveRecord::Migration[5.2]
  def change
    create_table :drills do |t|
      t.string :title
      t.string :description
      t.belongs_to :drill_group, foreign_key: true

      t.timestamps
    end
  end
end
