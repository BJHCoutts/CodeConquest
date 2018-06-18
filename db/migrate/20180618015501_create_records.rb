class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.references :drill, foreign_key: true
      t.references :transcript, foreign_key: true
      t.integer :student_answer
      t.boolean :is_correct

      t.timestamps
    end
  end
end
