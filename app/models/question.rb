class Question < ApplicationRecord
  belongs_to :drill
  has_many :students, through: :transcripts, source: :user
end
