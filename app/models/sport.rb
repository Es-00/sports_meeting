class Sport < ApplicationRecord
  validates :teamone,:wp,:status,:place, presence: true
  validates :teamone,:lp, numericality: { only_integer: true }
  validates :teamone,:teamtwo, length:{maximum:2}
  validates :wp,:lp, length:{maximum:3}
end
