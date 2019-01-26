class Player < ApplicationRecord
  validates :name, presence: true
  validates :position, presence: true

  belongs_to :game, optional: true
  belongs_to :team, optional: true
end
