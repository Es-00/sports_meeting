class Sport < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :teams

  validates :teamone,:status,:title,presence: true
  #validates :teamone,numericality: { only_integer: true }
  #validates :teamone,:teamtwo, length:{maximum:2}
  validates :wp,:lp, length:{maximum:30}
  validates :hour,:minute, numericality:{greater_than_or_equal_to: 0}
end
