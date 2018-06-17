class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :body
      t.string :options
      t.string :point
      t.belongs_to :drill, foreign_key: true

      t.timestamps
    end
  end
end
