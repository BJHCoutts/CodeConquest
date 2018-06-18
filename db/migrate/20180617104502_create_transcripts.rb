class CreateTranscripts < ActiveRecord::Migration[5.2]
  def change
    create_table :transcripts do |t|
      t.references :user, foreign_key: true
      t.references :drill, foreign_key: true
      t.integer :score
      t.integer :taken

      t.timestamps
    end
  end
end
