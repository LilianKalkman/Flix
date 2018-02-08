class ReviewsController < ApplicationController
  before_action :set_movie

  def index
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end
  
  def create
    @review = @movie.reviews.new(params_review)
    if @review.save
      redirect_to movie_reviews_path(@movie),
      notice: "Thanks for your review!"
    else
      render :new
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def params_review
    params.require(:review).permit(:name, :comment, :stars)
  end
end
