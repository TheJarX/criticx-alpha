class Company < ApplicationRecord
  validates :name, :country, allow_blank: false
  validates :name, uniqueness: true

  has_many :involved_companies

  has_many :reviews, as: :reviewable

end
