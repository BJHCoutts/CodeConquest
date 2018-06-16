class User < ApplicationRecord
  has_many :drill_groups, dependent: :nullify
end
