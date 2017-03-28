class Sport < ApplicationRecord
  validates :teamone,:wp,:status, presence: true
  #validates :teamone,numericality: { only_integer: true }
  #validates :teamone,:teamtwo, length:{maximum:2}
  validates :wp,:lp, length:{maximum:30}
end
