class User < ApplicationRecord
  has_secure_password()
  after_initialize :init

  has_many :drill_groups, dependent: :nullify
  has_many :taken_questions, through: :transcripts, source: :question


  def init
    self.score  ||= 0.0           #will set the default value only if it's nil
  end
  
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
