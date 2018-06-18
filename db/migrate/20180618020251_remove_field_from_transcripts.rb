class RemoveFieldFromTranscripts < ActiveRecord::Migration[5.2]
  def change
    remove_column :transcripts, :correct_questions, :string
    remove_column :transcripts, :wrong_questions, :string
  end
end
