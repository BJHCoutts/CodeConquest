class Drill < ApplicationRecord
  belongs_to :drill_group, optional: :true
  has_many :questions, dependent: :nullify
  has_many :students, through: :transcripts, source: :user
  validates :title, :description, presence: true

  # validates :difficulty, inclusion: { in: ["Beginner", "Intermediate", "Advanced"] }
end
