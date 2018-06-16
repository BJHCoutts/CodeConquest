class DrillGroup < ApplicationRecord
  belongs_to :user
  has_many :drills
end
