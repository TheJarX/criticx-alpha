class User < ApplicationRecord
  has_many :reviews

  before_save do
    self.review_count = 0 if self.review_count.nil?
    puts "WORKS!"
  end

end
