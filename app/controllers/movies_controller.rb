class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    # add a popularity ordering method
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = Review.where(movie_id: @movie.id)
    @review = Review.new
  end

end

