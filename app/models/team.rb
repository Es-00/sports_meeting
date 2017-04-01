class Team < ApplicationRecord
  has_many :sports
  validates :name,:points,:group, presence:true
end
