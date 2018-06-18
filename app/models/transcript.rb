class Transcript < ApplicationRecord
  belongs_to :user
  belongs_to :drill
  has_many :records, dependent: :nullify
end
