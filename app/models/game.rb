class Game < ApplicationRecord
  has_many :expansions, class_name: "Game", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Game", optional: true

  has_many :companies, through: :involved_companies
  has_and_belongs_to_many :platforms, :genres
end
