class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.integer :student_answer
      t.integer :correct_time
      t.integer :incorrect_time

      t.timestamps
    end
  end
end
