class Drill < ApplicationRecord
  belongs_to :drill_group, optional: :true

  validates :title, :description, :questions, :answers, presence: true
end
