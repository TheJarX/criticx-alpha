class InvolvedCompany < ApplicationRecord
  validates :developer, :publisher, presence: true
  belongs_to :companies
  belongs_to :games
end
