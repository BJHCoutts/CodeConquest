class DrillGroup < ApplicationRecord
  belongs_to :user
  has_many :drills, dependent: :nullify
end
