class Team < ApplicationRecord
  validates :team_name, presence: true, length: { maximum: 25}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  has_secure_password validations: true, presence: true, uniqueness: true

  has_many :games
  has_many :players
end
