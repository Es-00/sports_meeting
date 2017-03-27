class Sport < ApplicationRecord
  validates :teamone,:status,:place, presence: true
  validates :teamone,:wp,:lp, numericality: { only_integer: true }
  validates :teamone,:teamtwo, length:{maximum:2}
  validates :wp,:lp, length:{maximum:3}
end
