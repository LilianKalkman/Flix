class ReviewsController < ApplicationController
  def index
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews
  end
end
