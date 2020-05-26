class ParentGameValidator < ActiveModel::Validator
  def validate(game)
    if game.category == 1
      game.errors[:parent] << 'must be valid!' unless Game.exists?(game.parent_id)
    end
  end
end


class Game < ApplicationRecord
  include ActiveModel::Validations
  validates_with ParentGameValidator

  validates :name, :category, allow_blank: false
  validates :names, uniqueness: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than: 101 }

  has_many :reviews, as: :reviewable

  has_many :expansions, class_name: "Game", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Game", optional: true

  has_many :companies, through: :involved_companies
  has_and_belongs_to_many :platforms, :genres

  enum category: [:main_game, :expansion]
end
