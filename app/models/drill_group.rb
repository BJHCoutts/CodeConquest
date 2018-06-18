class DrillGroup < ApplicationRecord
  belongs_to :user
  has_many :drills, dependent: :nullify
  
  validates :title, :description, presence: true
end
