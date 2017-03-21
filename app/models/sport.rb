class Sport < ApplicationRecord
  validates :title,:winner,:loser,:wp,:lp, presence: true
  validates :winner,:loser,:wp,:lp, numericality: { only_integer: true }
  validates :winner,:loser, length:{maximum:2}
  validates :wp,:lp, length:{maximum:3}
end
