class User < ApplicationRecord
  has_secure_password()

  has_many :drill_groups, dependent: :nullify
  has_many :transcripts, dependent: :nullify
  has_many :taken_drills, through: :transcripts, source: :drill
  has_many :records, dependent: :nullify
  has_many :taken_questions, through: :records, source: :question

  has_many :drills, dependent: :nullify
  has_many :taken_drills, through: :records, source: :drill
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates(
    :email,
    presence: true,
    uniqueness: true,
    format: VALID_EMAIL_REGEX
  )

  validates :first_name, :last_name, presence: true

  def full_name
    first_name + " " + last_name
  end

end
