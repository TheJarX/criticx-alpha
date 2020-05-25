class Game < ApplicationRecord
  has_many :companies, through: :involved_companies
  has_and_belongs_to_many :platforms, :genres
end
