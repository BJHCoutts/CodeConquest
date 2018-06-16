class CreateTakes < ActiveRecord::Migration[5.2]
  def change
    create_table :takes do |t|
      t.references :drill_group, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :taken_time

      t.timestamps
    end
  end
end
