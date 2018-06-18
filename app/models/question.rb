class Question < ApplicationRecord
  belongs_to :drill
  has_many :records
  has_many :students, through: :records, source: :user
end
