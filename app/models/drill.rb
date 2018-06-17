class Drill < ApplicationRecord
  belongs_to :drill_group, optional: :true
  has_many :questions, dependent: :nullify
  validates :title, :description, presence: true
end
