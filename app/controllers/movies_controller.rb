class MoviesController < ApplicationController
  def index
    @movies = Movies.all
    # add a popularity ordering method
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
