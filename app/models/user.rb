class UserAgeValidator < ActiveModel::Validator
  def validate(user)
    user.errors[:birth_date] << 'You should be 16 years old to create an account' unless user.age < 16
  end
end
class User < ApplicationRecord
  include ActiveModel::Validations
  validates_with UserAgeValidator
  validates username, email, allow_blank: false

  has_many :reviews

  before_save do
    self.review_count = 0 if self.review_count.nil?
  end

  require 'date'

  # Method from Stackoverflow (thank u, philnash <3)
  def age(dob)
    dob = Date.parse(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - (now.month > dob.month || (now.month == dob.month && now.day >= dob.day) ? 0 : 1)
  end
end
