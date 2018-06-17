class DrillGroup < ApplicationRecord
  belongs_to :user
  has_many :drills, dependent: :nullify


  validates :title, :description, presence: true
  # validates :difficulty, inclusion: { in: ["Beginner", "Intermediate", "Advanced"] }
end
