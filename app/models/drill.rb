class Drill < ApplicationRecord
  belongs_to :drill_group

  validates :title, :description, :questions, :answers, presence: true
end
