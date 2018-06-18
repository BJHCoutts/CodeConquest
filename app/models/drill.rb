class Drill < ApplicationRecord
  belongs_to :drill_group, optional: :true
  has_many :questions, dependent: :nullify
  has_many :transcripts
  has_many :students, through: :transcripts, source: :user

  has_many :records
  # has_many :students, through: :records, source: :user

  validates :title, :description, presence: true
  # validates :difficulty, inclusion: { in: ["Beginner", "Intermediate", "Advanced"] }
end
