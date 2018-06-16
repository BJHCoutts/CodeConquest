class AddScoreToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :score, :interger
  end
end
