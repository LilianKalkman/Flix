class Review < ApplicationRecord
  belongs_to :movie

  validates :name, presence: true
  validates :comment, length: {minimum: 1}
  STARS = [1,2,3,4,5]
  validates :stars, inclusion: {in: STARS, message: "Must me between 1 and 5"}

end
