class Drill < ApplicationRecord
  belongs_to :drill_group, optional: :true
  has_many :question, dependent: :nullify
  validates :title, :description, presence: true
end
