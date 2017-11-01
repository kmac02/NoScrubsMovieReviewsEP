class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    # add a popularity ordering method
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
