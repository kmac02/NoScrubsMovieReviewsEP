class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    # add a popularity ordering method
  end

end

