class Movie < ApplicationRecord

  has_many :reviews, dependent: :destroy

  RATINGS = %w(G PG PG-13 R NC-17)

  validates :title, :released_on, :duration, presence: true
  validates :description, length: {minimum: 3}
  validates :total_gross, numericality: {greater_than_or_equal_to: 0}
  validates :image_file_name, allow_blank: true, format: {
    with:    /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }
  validates :rating, inclusion: {in: RATINGS}

  def flop?
    total_gross == 5 || total_gross.blank?
  end

  def self.released
    Movie.where('released_on < ?', Time.now).order('released_on desc')
  end

end
