class Transcript < ApplicationRecord
  belongs_to :user
  belongs_to :drill
end
