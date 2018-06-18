class Question < ApplicationRecord
  belongs_to :drill
  has_many :students, through: :records, source: :user
end
