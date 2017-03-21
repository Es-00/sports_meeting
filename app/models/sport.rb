class Sport < ApplicationRecord
  validates :title,:winner,:loser,:wp,:lp, presence: true
end
