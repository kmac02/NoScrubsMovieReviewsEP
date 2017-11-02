class MoviesController < ApplicationController
  def index
    # @movies = Movie.all
    @movies = Movie.order("created_at DESC").page params[:page]
    # add a popularity ordering method
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = Review.where(movie_id: @movie.id)
  end

end

