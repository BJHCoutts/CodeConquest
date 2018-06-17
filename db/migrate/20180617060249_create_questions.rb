class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :body
      t.string :answer
      t.string :options, array: true, default: []
      t.integer :point
      t.belongs_to :drill, foreign_key: true

      t.timestamps
    end
  end
end
