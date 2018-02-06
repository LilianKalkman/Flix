class MoviesController < ApplicationController
  def index
    @movies = ['It Takes Two', 'The Bucket List', 'The Leisure Seeker', 'Room' ]
  end
end
