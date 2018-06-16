class CreateDrills < ActiveRecord::Migration[5.2]
  def change
    create_table :drills do |t|
      t.string :title
      t.string :description
      t.json :questions
      t.string :answers, array: true
      t.integer :taken
      t.belongs_to :drill_group, foreign_key: true

      t.timestamps
    end
  end
end
