class Category < ApplicationRecord
  has_many :sports
  has_many :teams
end
