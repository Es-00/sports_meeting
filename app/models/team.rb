class Team < ApplicationRecord
  has_and_belongs_to_many :sports
  belongs_to :category

  validates :name,presence:true
  validates :points,numericality: { only_integer: true }
end
