class Company < ApplicationRecord
  validates :name, :country, presence: false
  validates :name, uniqueness: true

  has_many :involved_companies

  has_many :reviews, as: :reviewable

end
