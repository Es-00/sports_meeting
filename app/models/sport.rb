class Sport < ApplicationRecord
  validates :teamone,:teamtwo,:status,:place,:time, presence: true
  validates :teamone,:teamtwo,:wp,:lp, numericality: { only_integer: true }
  validates :teamone,:teamtwo, length:{maximum:2}
  validates :wp,:lp, length:{maximum:3}
end
