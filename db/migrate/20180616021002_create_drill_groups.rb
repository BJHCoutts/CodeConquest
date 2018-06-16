class CreateDrillGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :drill_groups do |t|
      t.string :title
      t.text :description
      t.string :difficulty
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
