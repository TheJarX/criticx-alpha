class InvolvedCompany < ApplicationRecord
  validades :developer, :publisher, allow_blank: false
  belongs_to :companies
  belongs_to :games
end
