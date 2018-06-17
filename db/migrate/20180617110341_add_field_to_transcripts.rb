class AddFieldToTranscripts < ActiveRecord::Migration[5.2]
  def change
    add_column :transcripts, :correct_questions, :integer, array: true
    add_column :transcripts, :wrong_questions, :integer, array: true
  end
end
