class Genre < ApplicationRecord
  validates :name, allow_blank: false, uniqueness: true
  has_and_belongs_to_many :games
end
