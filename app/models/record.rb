class Record < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :drill
  belongs_to :transcript
end
